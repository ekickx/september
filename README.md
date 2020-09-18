<p align="center">
<img src="https://media.giphy.com/media/f8c3iR9TzCCSDyIAsY/giphy.gif">
<br>
<strong><em>Reminds you when it's september</em></strong>
</p>

# Usage

## Github Token

- Go to your **Settings** > **Developer settings** > **Personal access tokens** and create new token with `repo` and `user` scope

- Copy the token

- Goto your repo's **Settings** > **Secrets** and then create new secret with the name `GITHUB_TOKEN` and the token you was copied as the value
  
  If you need more info, you can see [the github documentaion](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)

## Workflow Setting

```yaml
on:
  schedule:
    - cron: '30 17 * * *'

jobs:
  build:
    name: September
    runs-on: ubuntu-latest
    env:
      GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    steps:
      - uses: actions/checkout@v2
      - name: September action
        uses: ekickx/september@master 
```
