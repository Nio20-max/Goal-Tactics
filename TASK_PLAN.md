# Goal-Tactics Task Plan And Progress

Date: 2026-03-06
Scope: Execute user tasks 0-7 in strict order and record completion state.

## Task Status

- [x] 0. Create this exact plan/progress file and keep it updated.
- [x] 1. Build folder `Goal Tactics app` with ordered decompiled project structure that could be used to rebuild the APK; move useful unmatched files into an extra folder; write summary of important files and paths.
- [ ] 2. Write a very detailed frontend analysis that enables rebuild without app access (assuming all image assets are available).
- [ ] 3. Write exact summary of all API endpoints called and expected response contents.
- [ ] 4. Write exact account of app contents/features and what they did (clear, not too technical, concrete).
- [ ] 5. Write detailed account of server software and server details required to rebuild backend.
- [ ] 6. Move files/folders into clearer subfolder organization to reduce top-level clutter.
- [ ] 7. Push all changes to `origin master` from `/root/projekte/Goal-Tactics/`.

## Execution Plan (Ordered)

1. Task 1
- Create `/root/projekte/Goal-Tactics/Goal Tactics app/`.
- Build canonical subfolders: `android_project/`, `managed_dotnet/`, `decompiled_java/`, `assets_and_resources/`, `build_metadata/`, `extra_useful_files/`, `docs/`.
- Populate by copying decompiled (not compiled) source/resources/manifests/metadata from `output_dir/`, `decompiled/`, and extraction/decompile outputs.
- Produce `docs/important-files-and-paths-summary.md` describing key paths and file roles.

2. Task 2
- Create `docs/frontend-rebuild-analysis.md` with deep screen-by-screen flows, UI states, navigation, text keys, and interaction logic.

3. Task 3
- Create `docs/api-endpoints-and-response-contracts.md` from managed findings/decompiled clues.
- Mark confidence and evidence per endpoint; include expected request/response fields where recoverable.

4. Task 4
- Create `docs/app-content-and-function-overview.md` with complete but non-overly-technical feature account.

5. Task 5
- Create `docs/backend-server-rebuild-requirements.md` with server software stack and deployment/rebuild details inferred from app evidence.

6. Task 6
- Reorganize root into clearer top-level structure (`workspace/`, `analysis/`, `reverse_engineering/`, etc.) while preserving all content.
- Update paths in plan/docs if needed.

7. Task 7
- Run git status/add/commit.
- Push to `origin master`.
- Record push result in this plan.

## Progress Log

- 2026-03-06: Task 0 completed (plan file created).
- 2026-03-06: Task 1 completed (`Goal Tactics app/` created and populated; summary added at `Goal Tactics app/docs/important-files-and-paths-summary.md`).