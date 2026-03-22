-- Run this script in your Supabase SQL Editor to add the booking_time column
ALTER TABLE bookings 
ADD COLUMN booking_time TEXT;
