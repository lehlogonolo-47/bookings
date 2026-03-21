/**
 * Supabase Client Initialization
 * Replace the values below with your actual project credentials 
 * from the Supabase Settings > API tab.
 */

// If using CDN, this is how you initialize it in the browser:
// <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>

const SUPABASE_URL = 'https://vqhopsrwjfjystwsvuyy.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZxaG9wc3J3amZqeXN0d3N2dXl5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI1MzUyNzIsImV4cCI6MjA4ODExMTI3Mn0.jiWlLZHgrJkB0Bj024KJXlwcdJlfh42T96GsYi_6p60';

window.SUPABASE_CONFIG = { url: SUPABASE_URL, key: SUPABASE_KEY };

let supabaseClient;

try {
    // Check if the supabase library is loaded (from CDN)
    if (typeof supabase !== 'undefined') {
        supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_KEY);
        console.log("Supabase client initialized successfully.");
    } else {
        console.error("Supabase script not found. Make sure to include the CDN in your HTML.");
    }
} catch (error) {
    console.error("Error initializing Supabase client:", error);
}

// Export the client for use in other scripts
window.supabaseClient = supabaseClient;
