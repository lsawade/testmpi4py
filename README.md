# Testing `MPI.COMM_SELF.Spawn()`


## Create testing environment

```bash
module load anaconda3
conda create -n testmpipy "python>3.7"
conda activate testmpipy
```

## Installing `mpi4py`

The installation of `mpi4py` requires an `MPI` compiler, so we have to load
`openmpi/gcc` and and subsequently locate and use it to install `mpi4py`.

```bash
module load openmpi/gcc
MPICC=$(which mpicc) pip install --no-cache-dir mpi4py --no-binary all
```

No cache dir is making sure that no old version is installed.

## Test the MPI installation

The repo contains a function that is able to test whether `mpi4py` works correclty,
`test_mpi4py.py`.

```bash
mpiexec -np 4 python test_mpi4py.py
```

## Testing `MPI.COMM_SELF.Spawn()`

To test whether Python can Spawn MPI processes, we use the `test_parent.py` and
it's child `test_child.py` which contains the actual MPI code.

It has one requirement which is `numpy`, so let's install it

```bash
pip install numpy
```

And then run the script:

```bash
python test_parent.py
```

If the error is reproduced, the code will print a lot of errors and will get
stuck in MPI communication exit using

```bash
<CONTROL>+z
kill %1  # or whatever number reads: python test_parent.py
```

`test_parent.py` can dynamically assign a number of available cores in the
`MPI` pool and hand it to the `tetst_child.py`.

The goal here is not to run a fully fledged MPI code, but make a tiny part in the
serial code parallelized using `mpi4py`.

