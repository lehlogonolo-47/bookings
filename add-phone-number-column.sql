-- Run this script in your Supabase SQL Editor to add the phone number column to existing databases.
ALTER TABLE businesses ADD COLUMN IF NOT EXISTS phone_number TEXT;
