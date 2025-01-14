# Exercise 2: Using `git pull` and `push` with GitHub

Exercise 1 illustrated how to create a new git repository on your local computer. In this exercise we'll create a new repository on GitHub, *clone* it to our local computer, make changes, then *push* it back to GitHub. This is the more common way to create git repositories on GitHub.

1. Go to https://github.com and sign in if you are not already. Then go to https://github.com/new to create a new repository.

2. In the Owner section, click the drop down "Choose an owner" and select yourself.

3. In the "Repository name" field put `USERNAME-test-repo` where `USERNAME` is your username. *Note*: putting your username in the repo name normally isn't necessary. You'll do it this time because having a unique repository name will make doing Exercise 3 (which will use this) easier.

4. Under "Description" put "My test git repository."

5. Make sure "Public" is selected.

6. Check the box for "Add a README file". This will cause your repo to be initialized with a README.md file in it. It isn't strictly necessary, but is good to have, as it's what GitHub will show by default when people go to your repository.

7. Under "Choose a license" select "GNU General Public License v3.0". This will cause your repository to be initialized with a LICENSE file that has the GNU Public License v3.0 in it (an open source license). Choosing a license isn't strictly necessary, but it's good practice.

8. Now click the "Create repository" green button. This will create your repository. You will have the repository webpage open.

9. We want to add things to your repository. You can do that through the web interface, but it's easier to do it on your local computer, esepcially for code development so that you can test things. To do that we'll need a local copy of your repository. This is what `git clone` does: it downloads a local copy of your remote repository (which lives on GitHub) that can *track* the remote repository.

To clone the repository, click the Green `<> Code` button in the upper right, then select the "SSH" tab. We'll want the SSH version so that we can push changes later. To do this you'll need to have an SSH key uploaded to your GitHub repository (what you did in [Session1](../../session1). If you have not that, stop and go do [Session 1](../../session1), then return here.

10. Copy the URL in the SSH tab. Now open a terminal (you may want to open the terminal side-by-side with your web browser; it'll make doing the rest of this exercise easier). `cd` to the directory that you want your local copy of the repository to live, then type:
```
git clone SSH_URL
```
where `SSH_URL` is the URL you copied from GitHub.

11. When git clone finishes, you will have a new directory that has the same name as your repo on your computer. `cd` into that and type `ls`. You should see the `README.md` file and the `LICENSE` file.

12. This is your local copy of your repository. It's setup to track your repo on GitHub, which is called the `origin` repository. You can verify that by typing:
```
git remote -v
```
That will show you the URL of the origin. Note that this is printed twice: once for *fetching* (i.e., the default repo you will *pull* new updates from) and one for *pushing* (i.e., the repo to which you will *push* changes from your local computer).

13. Now let's add a file. In your terminal, use your favorite text editor to create a file called `mymath.py` and put the following in it:
```python
!#/usr/bin/env python

"""Some math functions."""

def add(a, b):
    return a + b
```

This is a simple python program that contains a function to add two numbers.

14. Add and commit your file to your repo:
```
git add mymath.py
git commit -m "add mymath file"
```
Check your history to see the commit by typing `git log`.

15. Now look at your copy of the repository on GitHub in your web browser. Is `mymath.py` there? No. Try refreshing the page. Is it there? Still no. This is because you have only commited the file to your *local* copy of the repository. The origin repository on GitHub doesn't know about these changes. To get the changes on to your origin repository, type:
```
git push
```
Go back to your web browser and refresh your repository page. You should now see the `mymath.py` file there. You can click on it to view it if you like. You can also see your commit history on GitHub (click the icon that looks like a clock just below the green `<> Code` button on the front page of your repository). Notice that the history on GitHub is the same as your history on your local computer. Your repos are in sync!

16. Let's create a branch to do some development work. We could do this on our local computer, but let's do it on GitHub instead. Click the drop down button that says "main" in the upper left corner of the website. Then click "View all branches". This will bring you to another page that shows you all your branches. Currently we only have one, `main`. Create a new branch by clicking the green `New branch` button in the upper right. In the "New branch name" field type `dev1` then click `Create new branch`. This will create the new branch.

17. Now let's make some changes on the `dev1` branch on our local computer. To do that, we'll need to update our local repo to pickup the new branch. Go to your terminal and type:
```
git fetch
```
You'll see a message telling you about the new branch `origin/dev1`. You still don't have this branch on your local repo! If you type `git branch`, you'll only see `* main`. The fetch command just informed your local repo about the existence of the `dev1` branch on GitHub. You can verify this by typing `git branch -r` to see the remote branches.

18. Let's checkout a local copy of the `dev1` branch. Type:
```
git checkout -b dev1 origin/dev1
```
Adding the extra `origin/dev1` instructs git to make your local `dev1` *track* the remote one. This means that when we `git push` from this branch it will by default push changes to the `dev1` branch on GitHub, not the `main` branch. You can verify which branch you will push to by typing:
```
git branch -vv
```

19. Let's modify `mymath.py` on `dev1`. On your local computer, use your favorite text editor to open `mymath.py` and add the following to it:
```python

def subtract(a, b):
    return a - b
```
Commit your changes to your local repo:
```
git add -u
git commit -m "add subtraction"
```

20. Again, your changes to your local `dev1` are not on GitHub yet. To do that, push the changes by typing:
```
git push
```
Note that when you did this, it pushed to the `dev1` branch on git hub (you'll see a message like `dev1 -> dev1`).

21. Now look at your web browser. As soon as you typed `git push` a message popped up that said "`dev1 ` had recent pushes" with a green `Compare and pull request` button popping up. Click that button. This will open a "pull request" page. The pull request page will automatically have a title that is the message from your last commit. You can optionally add a longer description. Then click the `Create pull request` button.

22. This will open "Pull request". Pull requests are GitHub's way of managing new development mergers. This particularly useful for collaborating with others on a project. You can use the pull request page to discuss changes before they are merged on to the main branch. You can alos have multiple pull requests open at once.

23. Let's merge your pull request. There's a green `Merge pull request` button at the bottom of the page. Click it, then "Confirm merge". This will merge your changes on `dev1` on to `main`. You now have the option to delete `dev1`. Feel free to click the delete dev1 branch button.

24. Now that your `main` branch on GitHub has the merged changes, your `main` branch on your local copy is out of sync. To update it, go to your terminal and switch to your main branch:
    ```
    git checkout main
    ```
    You can now bring it up to date with your remote repository by running `git pull`:
    ```
    git pull
    ```
    Once that's done, you can also delete your local copy of the `dev1` branch by typing:
    ```
    git branch -d dev1
    ```
