# Exercise 3: Collaborating in GitHub using the Fork and Pull Model

In this exercise you will learn how to collaborate with others using GitHub. You will work with a partner to contribute to the test repository they created on GitHub in [Exercise 2](../exercise2) (and they will do the same with your repository!).


1. Find a partner to work with. Get the web address of the test repository they created in Exercise 2. This is the URL of their repository website (*not* the ssh URL that they used to clone their repository). The URL should be something like `https://github.com/THEIR_USERNAME/THEIR_USERNAME-test-repo` where `THEIR_USERNAME` is your partner's GitHub username. **Again, you are going to the website for your *partner's* repository, not your own.**

2. Click the `Fork` button in the upper right of their website. This will open the "Create a new fork" page.

3. On the "Create a new fork" page:
    * Under "Owner" select **your username**.
    * Leave the repository name the same.
  The Owner / respository name should look like `YOUR_USERNAME / THEIR_USERNAME-test-repo`.

5. Now click the green `Create fork` button in the lower right. This will create a "fork" of your partner's repository under your own GitHub account. You will be redirected to your fork. Note the URL at the top of the webpage: it should be something like `https://github.com/YOUR_USERNAME/THEIR_USERNAME-test-repo`.

----

**About forks**: a *fork* is a copy of another user's GitHub repository. When you create the fork, you create copy of the repository under your GitHub account. The copy of the repository has the entire commit history of the repository up until that point. It is, for all intents and purposes, an exact replica of the original repository, except that the copy is now under your account.

From this point on, your fork is independent of the original. Since it is under your account, you are free to make any changes that you like to --- add commits or branches, delete things, etc. --- without affecting the original repository. Changes to the original repository also won't affect your fork unless you actively sync it by using `git fetch` (more on that below).

You can create a fork of any public repository on GitHub!

The advantage of using forks is it allows you to make develop things without breaking the original repository while you do. This is incredibly useful if you want to contribute to another project that is widely used: you create a fork of that project under your own GitHub account; clone your fork to your local computer; develop your fork by pushing/pulling between your local computer and GitHub. Then, when you are content that your new addition is ready, you fill out a pull request to merge the changes in your fork into the original repository (usually on its `main` branch). The original repo's owner(s) can then review your changes, and, if they accept them, merge it into their repository for widespread adoption. This is known as the [fork and pull model](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/getting-started/about-collaborative-development-models#fork-and-pull-model).

----

6. You want to contribute a new development to your partner's repository. To do so, first clone **your fork** of their repository to your local computer:
   * If you are not already their, go to your fork's website on GitHub. The web address should be something like `https://github.com/YOUR_USERNAME/THEIR_USERNAME-test-repo`.
   * On your fork's website, click the green `<> Code` button, then copy the SSH URL. It should be something like `git@github.com:YOUR_USERNAME/THEIR_USERNAME-test-repo.git`
   * Go to your terminal, `cd` to the directory you want to store your fork, and type:
```
git clone SSH_URL
```
where `SSH_URL` is the SSH URL you copied.

7. `cd` into the repository you just cloned and type
```
git remote -v
```
to see the `origin` URL. Note that the `origin` for this repository is your fork on GitHub, *not your partner's repository*.

8. Now let's create a branch called `dev2` to add a new feature to the `mymath.py` file. Create the branch on your local computer by typing:
```
git checkout -b dev2
```
This will create and switch to a new branch called `dev2`. You can verify you're on the new branch by typing `git branch`.

9. Use your favorite text editor to open `mymath.py` and add the following lines to it:
```

def multiply(a, b):
    return a*b
```
Save the changes.

10. Commit your changes by running:
```
git add -u
git commit -m "add multiplication function to mymath file"
```

11. This commit (and the `dev2` branch) currently only exists on your local copy of your fork. Push the branch to your fork on GitHub by running:
```
git push -u origin dev2
```
Note that we had to provide the `-u origin dev2` arguments to `git push`. This is because the `dev2` branch does not currently exist on our fork in GitHub. Adding the extra arguments tells git to create a `dev2` branch on your fork on GitHub and push the new changes there.

12. Look at your web browser. As soon as you pushed your changes, you should see a box pop up on fork's website on GitHub asking if you would like to file a pull request.

13. Click the green `Compare & pull request` button. This will open up the "Comparing changes" page. *Note that in the gray box at the top of the web page the "base" repository is *your partner's* original repository and the base branch is their `main` branch. This means that you will be creating a Pull Request on your partner's repository, and that it will be to merge your changes onto their `main` branch. You want that!

14. Fill out the description box if you like and/or change the the "Add a title" box. Then click the green `Create pull request` button at the bottom.

15. After you click `Create pull request`, your partner will see a Pull Request pop up on the GitHub website for *their* repository. Have them click on the the "Pull Requests" tab at the very top of their website, then click on the pull request.

16. Your partner can review your pull request on their GitHub website. If they are satisfied with it, have them click the green button at the bottom of the page, then `Confirm`, to merge the pull request.

Congratulations! You and your partner have now collaborated on a new feature.

17. Once your partner merges the changes, their `main` branch will update with your new commit. The `main` branch of *your* fork will now be out of sync with theirs. To sync it, go to to your GitHub website for your fork (the one with URL `https://github.com/YOUR_USERNAME/THEIR_USERNAME-test-repo`). You should see a gray dialog box at the top that starts with "This branch is 1 commit behind ...". Click the `Sync fork` button, then the green `Update branch` button. This will update your fork's main branch to be the same as your partner's.

18. Update your local copy of your fork. Go to your terminal and, in the repository directory, switch back to the main branch:
```
git checkout main
```
Now update your `main` branch by typing:
```
git pull
```
This will update your main to be the same the one on GitHub, which is also the same as your partner's main branch.

19. Now that your changes have been merged on to your partner's main branch and you've synced your fork both on GitHub and your computer, you're free to delete your development branch on your computer. To do so run:
```
git branch -d dev2
```
