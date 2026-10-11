# IDAT 7215 Midterm Review

Bilingual, question-first study site with a glossary, detailed per-question teaching notes, 15 course and exam PDFs, and optional cross-device progress sync.

## Live site

https://exefyx.github.io/idat7215-midterm-review/

## Public materials

The `materials/` directory contains the course slides, exam guidelines, and the three past-midterm PDFs supplied for this study project. The repository and those files are public and downloadable by anyone. Personal homework files and unrelated archives were not included.

## Cross-device progress sync

The site keeps working locally without a cloud account. To enable cloud sync:

1. Create a Supabase project.
2. Run [`supabase/schema.sql`](supabase/schema.sql) in the Supabase SQL Editor. It creates per-user, per-device rows protected by row-level security.
3. Add the GitHub Pages address `https://exefyx.github.io/idat7215-midterm-review/` to the Supabase Auth URL Configuration as the Site URL and an allowed redirect URL.
4. Configure email delivery for Supabase Auth. Its built-in email provider only sends to project team addresses; for other users, set up custom SMTP.
5. Put the project's **Project URL** and **publishable/anon key** in [`sync-config.js`](sync-config.js), then commit and push the file. These browser values are public; never use the Supabase service-role key in this site.

After configuration, each device signs in with the same email magic link. Progress is saved per device and merged for summaries and the wrong-question list. Use “退出账户” on shared devices.

## Local use

Open `index.html` in a modern browser. The generated question bank and teaching notes are included in the page.
