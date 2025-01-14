# Exercise 1: Practice with `git` on a local repository

In this exercise you will initialize a git repository on your computer and explore various git commands with it.

### Part 1: Initializing and adding files

1. Go to your home directory by typing:
```
cd
```

2. Create a directory called `test-git-repo` and `cd` into it:
```
mkdir test-git-repo
cd test-git-repo
```

3. At the moment, `test-git-repo` is just a normal directory, like any others. We want to turn this into a git repository and track changes to files made in this directory. To do that, run:
```
git init
```
*Note that you have to run this from within the directory you want to turn into a repository.*

4. `test-git-repo` is now tracked by `git`. Run:
```
git status
```
to see what the status of the repo is. You should get:
```
On branch main

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```

5. Let's add some files for git to track. Use your favorite text editor to create a file called `story_idea.txt` and add the following to it:
```
Once upon a time, in a land far,
far away...
```
Save and exit the file, then type `ls` to verify it's there. Now run
```
git status
```
again. You should have:
```
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	story_idea.txt

nothing added to commit but untracked files present (use "git add" to track)
```
git knows you have a file in the directory called `story_idea.txt`, but it isn't tracked by git yet!

6. Tell git to start tracking `story_idea.txt` by using `git add`. Run the following:
```
git add story_idea.txt
```
Now type `git status`. You'll see:
```
On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   story_idea.txt
```
Notice that it still says there are no commits, but that on the next commit the file `story_idea.txt` will be added. This means that `story_idea.txt` is *staged* for the next commit.

7. Commit the change by running:
```
git commit -m "add story idea"
```
Now run `git status`. You should get `nothing to commit, working tree clean`. Congratulations, you've made your first commit! To verify, run:
```
git log
```
to see the history of your commits. Since this is your first commit, there will only be one entry.

### Part 2: Making changes to files

1. You're not happy with your story opening. You don't want to write fairy tales, you want to write SciFi! Use your favorite text editor to open `story_idea.txt` and change the line `Once upon a time, in a land far,` to `A long time ago in a galaxy far,` so that your file now reads:
```
A long time ago in a galaxy far,
far away...
```
Much better. Now type `git status`; you should see:
```
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   story_idea.txt

no changes added to commit (use "git add" and/or "git commit -a")
```
git recognizes that `story_idea.txt` has changed, but your changes have not been committed yet. You can see how the file differs from the last commit you did by typing:
```
git diff
```

2. Let's commit your changes so you don't lose them! Let's stage the changes by running `git add` again:
```
git add story_idea.txt
```
(Alternatively, you can just run `git add -u` to stage changes to all tracked files that have changed.) Now run:
```
git commit -m "change opening"
```
to commit the changes. Run:
```
git log
```
You'll now see 2 commits in your history.

### Part 3: Branches

You want to start working on titles for your stories, but you want to do it independently of your work on the story itself. To do that, let's create a branch to specifically work on titles.

1. Run `git branch`. You should get back:
```
* main
```
This means there is currently only one branch, called `main`. The `*` next to `main` means that you are currently on the main branch. Let's create a new branch for working on the titles. Run:
```
git checkout -b title-dev
```
You'll get `Switched to a new branch 'title-dev'`. To verify, run `git branch` again. Now you should see:
```
  main
* title-dev
```
Notice that `story_idea.txt` is still here (type `ls`) and that your git history is the same as before (type `git log`). This is because when you create a branch, the branch will have all the same history and files as the main branch.

2. Let's create a file to store our title idea. Use your favorite text editor to create a file called `title.txt` and put in it:
```
STAR FIGHT!
```
(You can also use `echo` and the `>` operator on the command line to do this.) The title's not great, but you can't think of anything better at the moment.

3. Now that you've created the file, run `git status`; you should see that `title.txt` is untracked. Add it to be tracked and commit:
```
git add title.txt
git commit -m "add title idea"
```
Now type `git log`; you'll see you have 3 commits in your history.

4. Satisfied with your title for now, go back to your main branch to work on your story some more. Switch back to the `main` branch by running:
```
git checkout main
```
(Notice that we don't include the `-b` flag this time. This is because `main` already exists; we only add the `-b` when we want to create a new branch.) Verify that you're on main by running `git branch`; you should get:
```
* main
  title-dev
```
Note that the `*` is now next to main. 

Now type `ls`. The `title.txt` file is gone! To see why, type `git log`. Your last commit is no longer in your history; you just have the first two commits. This is because your last commit (and the file it created, `title.txt`) only exists on the `title-dev` branch. To verify that it's still there, you check the history of the `title-dev` branch by running:
```
git log title-dev
```

From now on (or until we merge the branches; more on that below) changes you make on `main` won't affect `title-dev` and vice veras.

5. Let's make some more changes to `story_idea.txt`. Use your favorite text editor to open `story_idea.txt` and add the following lines:
```

It is period of civil war.
Rebel spaceships, striking
from a hidden base, have won
their first victory against
the evil Galactic Empire.
```
Stage the change and commit it:
```
git add -u
git commit -m "add intro paragraph"
```
Now type `git log`: you should have 3 commits, none of which include the commits to `title-dev` branch.

7. In a flash of brilliance, you get an idea for the title of your story. Quick! Switch to your `title-dev` branch by typing:
```
git checkout title-dev
```
You can verify that you're on the `title-dev` branch by typing `git branch`. Now use your favorite text editor to open `title.txt` and change `STAR FIGHT!` to:
```
Star Wars
A NEW HOPE
```
Save and exit. Stage the change and commit it:
```
git add -u
git commit -m "final title"
```
Type `git log` to check your history. Note that there are 4 commits here: the first two from `main` (before you branched off), and the last two on `title-dev`.

8. Satisfied that your title is perfect, you no longer feel the need to keep the title development on a separate branch. It's ready to be *merged* on to the `main` branch. 

**Optional:** However, before merging the branches, it's usually good to first *rebase* the development branch's history to incorporate the changes that were made on `main` after the branch. This will make the history on `main` cleaner when we merge `title-dev`. To do that, while on the `title-dev` branch run:
```
git rebase main
```
You should get: "Successfully rebased and updated refs/heads/title-dev.". Now type `git log`. You should now see that the commit history on `title-dev` has all 3 commits from the `main` branch *followed by* the 2 commits you made on `title-dev`. 


9. You're now ready to merge `title-dev` back into `main`. Switch to the main branch:
```
git checkout main
```
and *merge* in the changes on `title-dev` by typing:
```
git merge title-dev
```
Now type `git log`. If you did the rebase in step 8, you'll see 5 commits: the 3 commits you made on `main` followed by the 2 on `title-dev`. If you skipped the rebase in step 8, you'll instead see 6 commits: the 5 commits (in a different order), followed by an additional "Merge" commit. Either way, if you type:
```
ls
```
you'll see that both `story_idea.txt` and `title.txt` are in your directory (on the main branch), and if you look in them, you'll see the most up-to-date versions of both.

----

*Note*: Again, the `rebase` step is *optional*. You could have skipped step 8 and gone to step 9. Skipping rebasing leads to a more complicated history, but rebasing can sometimes lead to complications that can be difficult to untangle. If you want to know more about the differences, see this article by the Atlassian corporation: [Merging vs. rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing).

----

10. Now that you've merged your `title-dev` branch, you can delete it to save space. To do that, run:
```
git branch -d title-dev
```
*Note:* if you had not merged everything on `title-dev` into `main`, you would have gotten an error preventing you from deleting the branch. The fact that you could delete it gives you confidence that everything on the development branch has been merged.
