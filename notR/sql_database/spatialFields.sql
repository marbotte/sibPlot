SELECT AddGeometryColumn('main','plot_spatial','pt_geom',4326,'POINT',2); 
SELECT AddGeometryColumn('main','plot_spatial','poly_geom',4326,'POLYGON',2);
ALTER TABLE main.plot_spatial ADD CONSTRAINT main_plot_spatial_point_or_polygon CHECK (pt_geom IS NOT NULL OR poly_geom IS NOT NULL);
CREATE INDEX plot_pt_gix ON main.plot_spatial USING GIST(pt_geom);
CREATE INDEX plot_poly_gix ON main.plot_spatial USING GIST(poly_geom);

SELECT AddGeometryColumn('main','sampling_unit_spat','pt_geom',4326,'POINT',2); 
SELECT AddGeometryColumn('main','sampling_unit_spat','poly_geom',4326,'POLYGON',2);
ALTER TABLE main.sampling_unit_spat ADD CONSTRAINT main_sampling_unit_spatial_point_or_polygon CHECK (pt_geom IS NOT NULL OR poly_geom IS NOT NULL);
CREATE INDEX su_pt_gix ON main.sampling_unit_spat USING GIST(pt_geom);
CREATE INDEX su_poly_gix ON main.sampling_unit_spat USING GIST(poly_geom);
