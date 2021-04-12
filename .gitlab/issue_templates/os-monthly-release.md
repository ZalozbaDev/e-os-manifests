<!-- If needed, you can edit the template at https://gitlab.e.foundation/e/os/releases/-/edit/master/.gitlab/issue_templates/releases.md -->

## Prepare

- [ ] update the milestone [issue board]()
- [ ] Share the test plan
    - [issues fixed]() <!--The issues part of each test build are the one closed, and with the corresponding milestone -->

## Test

- [ ] Share test build
    - [test session page] <!-- to be created at https://gitlab.e.foundation/teams/test-team/documentation/-/wikis/monthly-update/vX.Y -->
- [ ] Reopen the issues that appear as not fixed
    - if it's not possible to fix it before the release, change the milestone

## dev channel

- [ ] tag manifest
- [ ] create the release note
- [ ] check potential build issues

## stable channel

- [ ] Stable test session
- [ ] Warn ReCommerce
- [ ] Warn ESPRI DIGITAL
- [ ] Warn Link it up

## Release note template


```
# Please welcome our new /e/OS v0.15-q!

* 

## :hammer: <!-- Main topic of the update, if there is any -->

* 

## :sparkles: We embedded other improvements

<!-- other modifications which are not part of the main topic of this update -->


* 

## :clock10: Software updates

<!-- Updates from dependancies project -->

<!--
Q, Pie, Oreo, nougat: use the following url, https://review.lineageos.org/q/branch:<BRANCH>+status:merged+after:%2522<MERGED_AFTER>+%252B0100%2522+before:%2522<MERGED_BEFORE>+%252B0100%2522 
    - <BRANCH>: [lineage-17.1, lineage-16.0, lineage-15.1, cm-14.1]
    - <MERGED_AFTER>: use the merged before form the previous release note, available at https://gitlab.e.foundation/e/os/releases/-/releases (YYYY-MM-DD+HH:MM:SS)
    - <MERGED_BEFORE>: the last update manifest commit, available at https://gitlab.e.foundation/e/os/releases/-/commits (format: YYYY-MM-DD+HH:MM:SS)
-->
* We merged latest bugfixes and security [updates]() from **LineageOS** source code trees  

<!-- FP3: use the release note available on their forum: https://forum.fairphone.com/ (exemple: https://forum.fairphone.com/t/software-update-3-a-0077-20201221/69018) -->
* **Fairphone 3/Fairphone 3+**, we imported [3.A.XXX]() update

## :bug: Bug fixes

<!-- List of fixed bugs -->

* 

## :warning: Security fixes

<!-- Security patches -->

<!-- Q, Pie & oreo: pick up the link from the last security bulletin available at https://source.android.com/security/bulletin -->
This /e/OS update includes the **Android security patches** available for Q. More information in the link below.
* [Android February security patch](https://source.android.com/security/bulletin/2021-02-01)

<!-- Nougat: use the link already used for software updates  --> 
The AOSP project doesn't maintain anymore Android Nougat. But thanks to the community, some security patches available for Oreo are backported to Nougat. You will be able to find them in [the LineageOS changelog]()

---

<!-- Link to the corresponding milestone: https://gitlab.e.foundation/groups/e/-/milestones -->
*Find all the corresponding issues and their MRs on the [vX.Y milestone]()*
```

/confidential
