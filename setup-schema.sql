-- 1. Create Businesses Table
CREATE TABLE businesses (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT,
  email TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  theme_id TEXT DEFAULT 'classic',
  profile_picture TEXT,
  working_hours JSONB DEFAULT '{}'::jsonb,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Create Services Table
CREATE TABLE services (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  price TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Create Bookings Table
CREATE TABLE bookings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  client_name TEXT NOT NULL,
  client_email TEXT NOT NULL,
  service_name TEXT NOT NULL,
  service_price TEXT NOT NULL,
  booking_date DATE NOT NULL,
  booking_time TEXT,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. Enable Row Level Security (RLS)
ALTER TABLE businesses ENABLE ROW LEVEL SECURITY;
ALTER TABLE services ENABLE ROW LEVEL SECURITY;
ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;

-- 5. Policies for Businesses
CREATE POLICY "Public profiles are viewable by everyone" ON businesses
  FOR SELECT USING (true);

CREATE POLICY "Users can insert their own business profile" ON businesses
  FOR INSERT WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can update their own business profile" ON businesses
  FOR UPDATE USING (auth.uid() = id);

-- 6. Policies for Services
CREATE POLICY "Services are viewable by everyone" ON services
  FOR SELECT USING (true);

CREATE POLICY "Owners can manage their services" ON services
  FOR ALL USING (auth.uid() = business_id);

-- 7. Policies for Bookings
CREATE POLICY "Public can insert bookings" ON bookings
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Owners can view their bookings" ON bookings
  FOR SELECT USING (auth.uid() = business_id);

CREATE POLICY "Owners can update their bookings" ON bookings
  FOR UPDATE USING (auth.uid() = business_id);

CREATE POLICY "Owners can delete their bookings" ON bookings
  FOR DELETE USING (auth.uid() = business_id);
