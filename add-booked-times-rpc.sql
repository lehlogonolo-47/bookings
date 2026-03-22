-- Securely fetch booked time slots for a business on a specific date
-- This uses SECURITY DEFINER to bypass RLS and only returns the time strings, protecting client PII.

CREATE OR REPLACE FUNCTION get_booked_times(p_biz_id UUID, p_date DATE)
RETURNS TABLE (booked_time TEXT)
SECURITY DEFINER
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN QUERY
  SELECT b.booking_time
  FROM bookings b
  WHERE b.business_id = p_biz_id
    AND b.booking_date = p_date
    AND b.status IN ('pending', 'approved')
    AND b.booking_time IS NOT NULL;
END;
$$;
