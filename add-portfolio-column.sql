-- Add portfolio column to businesses table
ALTER TABLE businesses 
ADD COLUMN IF NOT EXISTS portfolio JSONB DEFAULT '[]'::jsonb;
