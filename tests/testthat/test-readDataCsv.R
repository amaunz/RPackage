context('readDataCsv')

set.seed(42)

# if (file.exists('../../data/kw.pm.rda')) {                    
#     load('../../data/kw.pm.rda')           
# } else {                                     
#     data(kw.pm)                     
# }

if (!exists('pkg_globals')) .onLoad()
assign_pkg_globals('dir', './')

