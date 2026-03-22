-- Add the theme_id column to the businesses table
-- Default is 'classic'
ALTER TABLE businesses 
ADD COLUMN theme_id TEXT DEFAULT 'classic';
