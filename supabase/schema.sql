create table if not exists public.study_progress_devices (
  user_id uuid not null references auth.users(id) on delete cascade,
  device_id text not null,
  data jsonb not null default '{"answered":{},"wrong":[],"lastOutcome":{}}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, device_id)
);

alter table public.study_progress_devices enable row level security;

drop policy if exists study_progress_devices_select_own on public.study_progress_devices;
create policy study_progress_devices_select_own
  on public.study_progress_devices for select to authenticated
  using (auth.uid() = user_id);

drop policy if exists study_progress_devices_insert_own on public.study_progress_devices;
create policy study_progress_devices_insert_own
  on public.study_progress_devices for insert to authenticated
  with check (auth.uid() = user_id);

drop policy if exists study_progress_devices_update_own on public.study_progress_devices;
create policy study_progress_devices_update_own
  on public.study_progress_devices for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists study_progress_devices_delete_own on public.study_progress_devices;
create policy study_progress_devices_delete_own
  on public.study_progress_devices for delete to authenticated
  using (auth.uid() = user_id);

grant select, insert, update, delete on public.study_progress_devices to authenticated;
