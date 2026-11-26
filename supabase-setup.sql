-- ============================================================
-- VELDGIDS VOORJAAR '27 — 1-KLIK SUPABASE SETUP
-- Plak dit hele script in Supabase > SQL Editor > New query
-- en klik op de groene knop 'Run'. Klaar!
-- ============================================================

create table if not exists public.veldgids_state (
  room_id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- Zet Row Level Security aan
alter table public.veldgids_state enable row level security;

-- Sta de app toe om jullie eigen gezinscode te lezen en bij te werken
drop policy if exists "Veldgids familie toegang" on public.veldgids_state;
create policy "Veldgids familie toegang"
  on public.veldgids_state
  for all
  to anon, authenticated
  using (true)
  with check (true);
