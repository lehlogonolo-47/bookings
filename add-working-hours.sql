-- Add working_hours JSONB column to store the schedule
ALTER TABLE businesses 
ADD COLUMN working_hours JSONB DEFAULT '{}'::jsonb;
