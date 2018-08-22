# UserLAnd-Assets-Debian
A repository for holding Debian specific assets for UserLAnd

After cloning this repo, you simply do the following...

`sudo ./scripts/buildArch.sh $desiredArch` 
`./scripts/installArch.sh $desiredArch`

where `desiredArch` can be `arm`, `arm64`, `x86`, `x86_64`
`all` does not mean all of the previous.  It just relates to the files under assets/all
