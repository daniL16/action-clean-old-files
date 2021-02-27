# action-clean-old-files

<p align="center">
  Delete old files from a directory. This action deletes the files that meet the imposed conditions and performs a pull request to the base branch.
</p>

## Args

- GITHUB_TOKEN (required)
- dir (required): Directory to be processed
- base_branch: Base branch to pull request (default: develop)
- days_old: Days that must pass for a file to be erased (default: 120)
- pr_title: Pull request title
## 🚀 Usage

Create a file inside the `.github/workflows` directory and paste:

```yml

name: Delete old migrations

on:
  schedule:
    - cron:  '0 0 * * *'
jobs:
  delete_files:
    runs-on: ubuntu-latest
    name: Delete old migrations
    steps:
      - uses: actions/checkout@master
      - uses: daniL16/action-clean-old-files@master
        with:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          dir: './api/migrations'
          base_branch: 'master'
          days_old: '60'

```

