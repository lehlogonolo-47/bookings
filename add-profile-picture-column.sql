-- Run this script in your Supabase SQL Editor to add the profile_picture column to existing tables
ALTER TABLE businesses 
ADD COLUMN profile_picture TEXT;
