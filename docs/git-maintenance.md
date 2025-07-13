# Git Branch Cleanup and Renaming

**Date:** 2025-07-13  
**Purpose:** Organize Git branches in the `devops-learning` repository to follow a consistent naming scheme (`dayX-topic`) and document the cleanup process.

---

## Why This Was Done

Originally, branches were named inconsistently (e.g., `feature/disk-usage`). Starting from Day 6, I adopted a consistent naming format like `day6-ec2-setup`. To reflect this across earlier days and maintain a professional, portfolio-friendly structure, I renamed and cleaned up old branches both locally and on GitHub.

---

## Steps Followed

### 1. Rename a Local Branch

```bash
git checkout old-branch-name
git branch -m new-branch-name
```

Example:

```bash
git checkout feature/disk-usage
git branch -m day2-sysinfo-diskusage
```

### 2. Push the Renamed Branch to GitHub

```bash
git push origin new-branch-name
```

Example:

```bash
git push origin day2-sysinfo-diskusage
```

### 3. Delete the Old Branch on GitHub

```bash
git push origin --delete old-branch-name
```

Example:

```bash
git push origin --delete feature/disk-usage
```

### 4. Delete the Old Local Branch (Optional)

If you’re not on the branch and want to delete it locally:

```bash
git branch -d old-branch-name
```

If the branch is unmerged and you’re sure:

```bash
git branch -D old-branch-name
```

---

## Tips

- Use `git branch -r` to list all remote branches.
- Use `git fetch -p` to prune deleted remote branches locally.
- Use `git checkout -b local-name origin/remote-name` to retrieve a branch that only exists remotely.

---

## Outcome

- All branches now follow the consistent `dayX-topic` naming convention.
- GitHub and local branches are in sync.
- Easier navigation and clearer commit history.
---

**Author:** Danish Sajid  
**DevOps Learning Plan – Day 9 Extension**
