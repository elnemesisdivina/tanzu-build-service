Not many steps required to make a custom stack

Add the following lines to the build image Dockerfile and the run image Dockerfile

```
LABEL "io.buildpacks.stack.id"="some id that matches what your buildpacks expect"
ENV CNB_STACK_ID="same id as in the LABEL command"
ENV CNB_USER_ID="the Linux user ID of the user in the image you want to use"
ENV CNB_GROUP_ID="the Linux group ID of the group in the image you want to use"
```