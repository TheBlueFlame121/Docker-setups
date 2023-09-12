# Docker-setups
A collection of different dockers that I use. It is intended to be very user friendly so that even people who have no experience with docker can use them easily.

## The Dockers:
All the dockers come with `python3` which has `pwntools` and `tqdm` installed. They're based on `ubuntu:jammy`

-**Sagemath**: Contains an installation of the latest `Sagemath` stable release found on their [Github](https://github.com/sagemath/sage/). \
-**Flatter**: Contains an installation of `fplll` from [fplll/fplll](https://github.com/fplll/fplll) and `flatter` from [keeganryan/flatter](https://github.com/keeganryan/flatter). \
-**G6k**: Contains an installation of `fplll` from [fplll/fplll](https://github.com/fplll/fplll), `fpylll` from [fplll/fpylll](https://github.com/fplll/fpylll), and `g6k` (Generalised Sieve Kernel) from [fplll/g6k](https://github.com/fplll/g6k).

## How to use
Think of the docker container as a vm/ssh connection. Using the scripts you can login to the vm/make the ssh connection and you'll end up with a terminal shell in the container.
- Open the desired docker folder
- Use `run.sh` to start the container and `stop.sh` to stop it
- `start.sh` can be used to start using the container, akin to logging into a vm.
- You only need to use `run.sh` once and then you can enter and exit the container any number of times.
- If you make any modification to the image by editing the `Dockerfile` then use `build.sh` to rebuild the image.

By default you'll be logged in as the `noroot` user. So any command you run will be run without root permissions. However using `sudo` will make the command run with root permissions without asking for any password.

## Resources
-**Docker**: Official Website is [https://www.docker.com/](https://www.docker.com/) \
-**Sagemath**: Official Website is [https://www.sagemath.org/](https://www.sagemath.org/) which contains documentation as well \
-**g6k**: Paper on eprint [https://eprint.iacr.org/2019/089](https://eprint.iacr.org/2019/089)
