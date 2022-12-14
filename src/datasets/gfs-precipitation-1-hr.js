export const name = "precipitation in previous hour";

export const metadata = {
  unit: "mm",
};

export const grib2_options = {
  match: ":APCP:surface:0-",
};

export const accumulation = {
  reset: Infinity,
};

export const variable = "gfs_precipitation_1hr";
