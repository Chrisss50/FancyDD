clearAll()
pdb = PDBFile(Path().find("structures/bpti.pdb"))
S = System()
pdb.read(S)
getMainControl().insert(S)
getMolecularStructure().addHydrogens()
getMolecularControl().applySelector("element(H)")
amber = getMolecularStructure().getAmberFF()
amber.setup(S)
m = SteepestDescentMinimizer(amber)
m.minimize(100) 