// Note: Adapted from Trent Mize's usetdm

capture 	program drop usecda
program 	define usecda, rclass
	version 12.0
	
	syntax namelist, [clear]

	qui count
	local N = `r(N)'	
	
	if "`clear'" == "" & `N' != 0 {
	di as err "Data in memory will be lost. Specify option clear to load anyway."
	exit	
	}
	
	else {
	di "Loading dataset..." 
	use "https://github.com/ahmanners/cda/raw/master/data/`namelist'.dta", `clear'
	}
end
		
