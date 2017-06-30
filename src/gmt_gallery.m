function  [ps_, t_path_] = gmt_gallery(varargin)
%	The examples Gallery in GMT-MEX API
%
% gmt_gallery(OPT, R_DIR, O_PATH, VERBOSE)
% or
% [ps_, t_path_] = gmt_gallery(OPT, R_DIR, O_PATH, VERBOSE)
%
% If R_DIR and O_PATH are not transmitted, the defaul value in this function is used (JL paths)
% R_DIR is a string with the path to the root of your GMT installation. E.g.
%	R_DIR = 'C:/progs_cygw/GMTdev/gmt5/trunk/'
%
% O_PATH is a string with the output path where the new PS files will be writen
%
% If only R_DIR is set than O_PATH will default to current directory
%
% If the last argin is a logical variable that the examples are run in verbose mode
%
% Examples:
%	gmt_gallery([], true)           Run all examples in verbose mode and use GMT_{ROOT|PLOT}_DIR paths
%	gmt_gallery('ex03', true)       Run example3 in verbose mode and use GMT_{ROOT|PLOT}_DIR paths
%	gmt_gallery([], '/user/PW_GMT_location/', true)	Run all examples in verbose mode and set GMT_ROOT_DIR location

%	$Id: gmt_gallery.m 612 2017-06-02 18:59:40Z jluis $

	global GMT_ROOT_DIR GMT_PLOT_DIR
	if (~exist('GMT_ROOT_DIR', 'var') || isempty(GMT_ROOT_DIR))
		GMT_ROOT_DIR = 'C:/progs_cygw/GMTdev/gmt5/trunk/';
		GMT_PLOT_DIR = 'V:/';		% Set this if you want to save the PS files in a prticular place
	end
	% Check if any of the input args is a logical, if yes set verbose to true.
	verbose = false;
	c = false(1, numel(varargin));
	for (k = 1:numel(varargin))
		if isa(varargin{k}, 'logical')
			verbose = true;
			c(k) = true;
		end
	end
	varargin(c) = [];		% Remove the eventual logical argument

	n_args = numel(varargin);
	if (n_args >= 2)
		g_root_dir = varargin{2};
		if (n_args == 3),	out_path = varargin{3};
		else				out_path = './';		% Current dir
		end
	else
		% Edit those two for your own needs
		g_root_dir = GMT_ROOT_DIR;
		out_path = GMT_PLOT_DIR;		% Set this if you want to save the PS files in a particular place
	end

	ps = [];	t_path = [];	% Defaults for the case we have an error

	all_exs = {'ex01' 'ex02' 'ex04' 'ex05' 'ex06' 'ex07' 'ex08' 'ex09' 'ex10' 'ex12' 'ex13' 'ex14' ...
		'ex15' 'ex16' 'ex17' 'ex18' 'ex19' 'ex20' 'ex21' 'ex22' 'ex23' 'ex24' 'ex25' 'ex26' 'ex27' 'ex28' ...
		'ex29' 'ex30' 'ex32' 'ex33' 'ex34' 'ex35' 'ex36' 'ex37' 'ex38' 'ex39' 'ex40' 'ex41' 'ex42' ...
		'ex44' 'ex45' 'ex46'}; 

	if (n_args == 0 || isempty(varargin{1}))
		opt = all_exs;
	else
		opt = varargin(1);		% Make it a cell to fit the other branch
	end

	try
		for (k = 1: numel(opt))
			switch opt{k}
				case 'ex01',   [ps, t_path] = ex01(g_root_dir, out_path, verbose);
				case 'ex02',   [ps, t_path] = ex02(g_root_dir, out_path, verbose);
				case 'ex03',   [ps, t_path] = ex03(g_root_dir, out_path, verbose);
				case 'ex04',   [ps, t_path] = ex04(g_root_dir, out_path, verbose);
				case 'ex05',   [ps, t_path] = ex05(g_root_dir, out_path, verbose);
				case 'ex06',   [ps, t_path] = ex06(g_root_dir, out_path, verbose);
				case 'ex07',   [ps, t_path] = ex07(g_root_dir, out_path, verbose);
				case 'ex08',   [ps, t_path] = ex08(g_root_dir, out_path, verbose);
				case 'ex09',   [ps, t_path] = ex09(g_root_dir, out_path, verbose);
				case 'ex10',   [ps, t_path] = ex10(g_root_dir, out_path, verbose);
				case 'ex11',   [ps, t_path] = ex11(g_root_dir, out_path, verbose);
				case 'ex12',   [ps, t_path] = ex12(g_root_dir, out_path, verbose);
				case 'ex13',   [ps, t_path] = ex13(g_root_dir, out_path, verbose);	% Have to call gmt('destroy') twice to PASS
				case 'ex14',   [ps, t_path] = ex14(g_root_dir, out_path, verbose);	% Fails because 'grdtrack -G -o2,3' is not respected
				case 'ex15',   [ps, t_path] = ex15(g_root_dir, out_path, verbose);
				case 'ex16',   [ps, t_path] = ex16(g_root_dir, out_path, verbose);	% Have to call gmt('destroy') twice to PASS
				case 'ex17',   [ps, t_path] = ex17(g_root_dir, out_path, verbose);
				case 'ex18',   [ps, t_path] = ex18(g_root_dir, out_path, verbose);
				case 'ex19',   [ps, t_path] = ex19(g_root_dir, out_path, verbose);
				case 'ex20',   [ps, t_path] = ex20(g_root_dir, out_path, verbose);
				case 'ex21',   [ps, t_path] = ex21(g_root_dir, out_path, verbose);
				case 'ex22',   [ps, t_path] = ex22(g_root_dir, out_path, verbose);
				case 'ex23',   [ps, t_path] = ex23(g_root_dir, out_path, verbose);
				case 'ex24',   [ps, t_path] = ex24(g_root_dir, out_path, verbose);
				case 'ex25',   [ps, t_path] = ex25(g_root_dir, out_path, verbose);
				case 'ex26',   [ps, t_path] = ex26(g_root_dir, out_path, verbose);
				case 'ex27',   [ps, t_path] = ex27(g_root_dir, out_path, verbose);
				case 'ex28',   [ps, t_path] = ex28(g_root_dir, out_path, verbose);
				case 'ex29',   [ps, t_path] = ex29(g_root_dir, out_path, verbose);
				case 'ex30',   [ps, t_path] = ex30(g_root_dir, out_path, verbose);
				case 'ex31',   [ps, t_path] = ex31(g_root_dir, out_path, verbose);	% Not yet
				case 'ex32',   [ps, t_path] = ex32(g_root_dir, out_path, verbose);
				case 'ex33',   [ps, t_path] = ex33(g_root_dir, out_path, verbose);
				case 'ex34',   [ps, t_path] = ex34(g_root_dir, out_path, verbose);
				case 'ex35',   [ps, t_path] = ex35(g_root_dir, out_path, verbose);
				case 'ex36',   [ps, t_path] = ex36(g_root_dir, out_path, verbose);
				case 'ex37',   [ps, t_path] = ex37(g_root_dir, out_path, verbose);
				case 'ex38',   [ps, t_path] = ex38(g_root_dir, out_path, verbose);
				case 'ex39',   [ps, t_path] = ex39(g_root_dir, out_path, verbose);
				case 'ex40',   [ps, t_path] = ex40(g_root_dir, out_path, verbose);
				case 'ex41',   [ps, t_path] = ex41(g_root_dir, out_path, verbose);
				case 'ex42',   [ps, t_path] = ex42(g_root_dir, out_path, verbose);
				case 'ex43',   [ps, t_path] = ex43(g_root_dir, out_path, verbose);	% Not yet
				case 'ex44',   [ps, t_path] = ex44(g_root_dir, out_path, verbose);
				case 'ex45',   [ps, t_path] = ex45(g_root_dir, out_path, verbose);	% Have to call gmt('destroy') three times to PASS
				case 'ex46',   [ps, t_path] = ex46(g_root_dir, out_path, verbose);
			end
			if (verbose)
				go = input ('==> Hit return to continue', 's');
			end
		end
	catch
		sprintf('Error in test: %s\n%s', opt{k}, lasterr)
	end

	if (nargout)
		ps_ = ps;	t_path_ = t_path;
	end

	gmt('destroy')

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex01(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex01/'];
	ps = [out_path 'example_01.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set MAP_GRID_CROSS_SIZE_PRIMARY 0 FONT_ANNOT_PRIMARY 10p PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt('destroy')
	gmt(['psbasemap -R0/6.5/0/7.5 -Jx1i -B0 -P -K > ' ps])
	gmt(['pscoast -Rg -JH0/6i -X0.25i -Y0.2i -O -K -Bg30 -Dc -Glightbrown -Slightblue >> ' ps])
	cmd = ['grdcontour ' d_path 'osu91a1f_16.nc'];
	gmt([cmd ' -J -C10 -A50+f7p -Gd4i -L-1000/-1 -Wcthinnest,- -Wathin,- -O -K -T+d0.1i/0.02i >> ' ps])
	gmt([cmd ' -J -C10 -A50+f7p -Gd4i -L-1/1000 -O -K -T+d0.1i/0.02i >> ' ps])
	gmt(['pscoast -Rg -JH6i -Y3.4i -O -K -B+t"Low Order Geoid" -Bg30 -Dc -Glightbrown -Slightblue >> ' ps])
	gmt([cmd ' -J -C10 -A50+f7p -Gd4i -L-1000/-1 -Wcthinnest,- -Wathin,- -O -K -T+d0.1i/0.02i+l >> ' ps])
	gmt([cmd ' -J -C10 -A50+f7p -Gd4i -L-1/1000 -O -T+d0.1i/0.02i+l >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex02(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex02/'];
	ps = [out_path 'example_02.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set FONT_TITLE 30p MAP_ANNOT_OBLIQUE 0 PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt('destroy')
	g_cpt = gmt('makecpt -Crainbow -T-2/14/2');
	gmt(['grdimage ' d_path 'HI_geoid2.nc -R160/20/220/30r -JOc190/25.5/292/69/4.5i -C' ...
		' -E50 -K -P -B10 -X1.5i -Y1.25i > '  ps], g_cpt)
	gmt(['psscale -DJRM+o0.6i/0+e+mc -R -J -O -K -Bx2+lGEOID -By+lm >> ' ps], g_cpt)
	t_cpt = gmt(['grd2cpt ' d_path 'HI_topo2.nc -Crelief -Z']);
	GHI_topo2_int = gmt(['grdgradient ' d_path 'HI_topo2.nc -A0 -Nt']);
	gmt(['grdimage ' d_path 'HI_topo2.nc -I -R -J -B+t"H@#awaiian@# T@#opo and @#G@#eoid@#"' ...
        ' -B10 -E50 -O -K -C -Y4.5i --MAP_TITLE_OFFSET=0.5i >> ' ps], GHI_topo2_int, t_cpt)
	gmt(['psscale -DJRM+o0.6i/0+mc -R -J -O -K -I0.3 -Bx2+lTOPO -By+lkm >> ' ps], t_cpt)
	gmt(['pstext -R0/8.5/0/11 -Jx1i -F+f30p,Helvetica-Bold+jCB -O -N -Y-4.5i >> ' ps], {'-0.4 7.5 a)' '-0.4 3.0 b)'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex03(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex03/'];
	ps = [out_path 'example_03a.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')

	% First, we use "gmt fitcircle" to find the parameters of a great circle
	% most closely fitting the x,y points in "sat.xyg":

	cpos = gmt(['fitcircle ' d_path 'sat.xyg -L2 -Fm']);
	cposx = cpos.data(1,1);	cposy = cpos.data(1,2);
	ppos = gmt(['fitcircle ' d_path 'sat.xyg -L2 -Fn']);
	pposx = ppos.data(1,1);	pposy = ppos.data(1,2);

	% Now we use "gmt project" to gmt project the data in both sat.xyg and ship.xyg
	% into data.pg, where g is the same and p is the oblique longitude around
	% the great circle.  We use -Q to get the p distance in kilometers, and -S
	% to sort the output into increasing p values.

	sat_pg  = gmt(sprintf('project %ssat.xyg -C%f/%f -T%f/%f -S -Fpz -Q', d_path, cposx, cposy, pposx, pposy));
	ship_pg = gmt(sprintf('project %sship.xyg -C%f/%f -T%f/%f -S -Fpz -Q', d_path, cposx, cposy, pposx, pposy));
	sat_pg  = sat_pg.data;
	ship_pg = ship_pg.data;

	% The gmtinfo utility will report the minimum and maximum values for all columns. 
	% We use this information first with a large -I value to find the appropriate -R
	% to use to plot the .pg data. 
	R = gmt('gmtinfo -I100/25', [sat_pg; ship_pg]);
	R = R.text{1};
	gmt(['psxy ' R ' -UL/-1.75i/-1.25i/"Example 3a in Cookbook" -BWeSn' ...
		' -Bxa500f100+l"Distance along great circle" -Bya100f25+l"Gravity anomaly (mGal)"' ...
		' -JX8i/5i -X2i -Y1.5i -K -Wthick > ' ps], sat_pg)
	gmt(['psxy -R -JX -O -Sp0.03i >> ' ps], ship_pg)

	% From this plot we see that the ship data have some "spikes" and also greatly
	% differ from the satellite data at a point about p ~= +250 km, where both of
	% them show a very large anomaly.

	% To facilitate comparison of the two with a cross-spectral analysis using "gmt spectrum1d",
	% we resample both data sets at intervals of 1 km.  First we find out how the data are
	% typically spaced using $AWK to get the delta-p between points and view it with 
	% "gmt pshistogram".

	ps = [out_path 'example_03b.ps'];

	gmt(['pshistogram -W0.1 -Gblack  -JX3i -K -X2i -Y1.5i -B0 -B+t"Ship" -UL/-1.75i/-1.25i/"Example 3b in Cookbook"' ...
		' > ' ps], diff(ship_pg))
	gmt(['pshistogram  -W0.1 -Gblack -JX3i -O -X5i -B0 -B+t"Sat" >> ' ps], diff(sat_pg))

	% This experience shows that the satellite values are spaced fairly evenly, with
	% delta-p between 3.222 and 3.418.  The ship values are spaced quite unevenly, with
	% delta-p between 0.095 and 9.017.  This means that when we want 1 km even sampling,
	% we can use "gmt sample1d" to interpolate the sat data, but the same procedure applied
	% to the ship data could alias information at shorter wavelengths.  So we have to use
	% "gmt filter1d" to resample the ship data.  Also, since we observed spikes in the ship
	% data, we use a median filter to clean up the ship values.  We will want to use "paste"
	% to put the two sampled data sets together, so they must start and end at the same
	% point, without NaNs.  So we want to get a starting and ending point which works for
	% both of them.  We use ceil/floor and min/max for that.

	sampr1 = max([ceil(ship_pg(1,1))    ceil(sat_pg(1,1))]);
	sampr2 = min([floor(ship_pg(end,1)) floor(sat_pg(end,1))]);
	
	% Now we can use sampr1|2 in gmt gmtmath to make a sampling points file for gmt sample1d:
	samp_x = gmt(['gmtmath ' sprintf('-T%d/%d/1', sampr1, sampr2) ' -N1/0 T =']);

	% Now we can resample the gmt projected satellite data:
	samp_sat_pg = gmt('sample1d -N', sat_pg, samp_x);

	% For reasons above, we use gmt filter1d to pre-treat the ship data.  We also need to sample
	% it because of the gaps > 1 km we found.  So we use gmt filter1d | gmt sample1d.  We also
	% use the -E on gmt filter1d to use the data all the way out to sampr1/sampr2 :
	t = gmt(['filter1d -Fm1 ' sprintf('-T%d/%d/1', sampr1, sampr2) ' -E'], ship_pg); 
	samp_ship_pg = gmt('sample1d -N', t, samp_x);

	ps = [out_path 'example_03c.ps'];

	% Now we plot them again to see if we have done the right thing:
	gmt(['psxy ' R ' -JX8i/5i -X2i -Y1.5i -K -Wthick' ...
		' -Bxa500f100+l"Distance along great circle" -Bya100f25+l"Gravity anomaly (mGal)"' ...
		' -BWeSn -UL/-1.75i/-1.25i/"Example 3c in Cookbook" > ' ps], samp_sat_pg)
	gmt(['psxy -R -JX -O -Sp0.03i >> ' ps], samp_ship_pg)

	% Now to do the cross-spectra, assuming that the ship is the input and the sat is the output 
	% data, we do this:
	t = [samp_ship_pg.data(:,2) samp_sat_pg.data(:,2)];
	spects = gmt('spectrum1d -S256 -D1 -W -C -N', t);
 
	% Now we want to plot the spectra. The following commands will plot the ship and sat 
	% power in one diagram and the coherency on another diagram, both on the same page.  
 	% We end by adding a map legends and some labels on the plots.
	% For that purpose we often use -Jx1i and specify positions in inches directly:

	ps = [out_path 'example_03.ps'];	ps_out = ps;
	gmt(['psxy -Bxa1f3p+l"Wavelength (km)" -Bya0.25f0.05+l"Coherency@+2@+" -BWeSn+g240/255/240' ...
		' -JX-4il/3.75i -R1/1000/0/1 -P -K -X2.5i -Sc0.07i -Gpurple -Ey/0.5p -Y1.5i > ' ps], spects.data(:,[1 16 17]))

	gmt(['pstext -R -J -F+cTR+f18p,Helvetica-Bold -Dj0.1i -O -K >> ' ps], {'Coherency@+2@+'})
	gmt(['psxy -Bxa1f3p -Bya1f3p+l"Power (mGal@+2@+km)" -BWeSn+t"Ship and Satellite Gravity"+g240/255/240' ...
		' -Gred -ST0.07i -O -R1/1000/0.1/10000 -JX-4il/3.75il -Y4.2i -K -Ey/0.5p >> ' ps], spects.data(:,1:3))
	gmt(['psxy -R -JX -O -K -Gblue -Sc0.07i -Ey/0.5p >> ' ps], spects.data(:,[1 4 5]))
	gmt(['pstext -R0/4/0/3.75 -Jx1i -F+cTR+f18p,Helvetica-Bold -Dj0.1i -O -K >> ' ps], {'Input Power'})
	legend = {'S 0.1i T 0.07i red - 0.3i Ship',
	   'S 0.1i c 0.07i blue - 0.3i Satellite'};
	gmt(['pslegend -R -J -O -DjBL+w1.2i+o0.25i -F+gwhite+pthicker --FONT_ANNOT_PRIMARY=14p,Helvetica-Bold >> ' ps], legend)
	

	% Now we wonder if removing that large feature at 250 km would make any difference.
	% We could throw away a section of data with $AWK or sed or head and tail, but we
	% demonstrate the use of "gmt trend1d" to identify outliers instead.  We will fit a
	% straight line to the samp_ship.pg data by an iteratively-reweighted method and
	% save the weights on output.  Then we will plot the weights and see how things look:

	ps = [out_path 'example_03d.ps'];

	samp_ship_xw = gmt('trend1d -Fxw -Np2+r', samp_ship_pg);
	gmt(['psxy ' R ' -JX8i/4i -X2i -Y1.5i -K -Sp0.03i' ...
		' -Bxa500f100+l"Distance along great circle" -Bya100f25+l"Gravity anomaly (mGal)"' ...
		' -BWeSn -UL/-1.75i/-1.25i/"Example 3d in Cookbook" > ' ps], samp_ship_pg)
	R = gmt('gmtinfo -I100/1.1', samp_ship_xw);
	R = R.text{1};
	gmt(['psxy ' R ' -JX8i/1.1i -O -Y4.25i -Bxf100 -Bya0.5f0.1+l"Weight" -BWesn -Sp0.03i >> ' ps], samp_ship_xw)
	builtin('delete','gmt.conf');

	ps = ps_out;	% This the one we want to return

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex04(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex04/'];
	ps = [out_path 'example_04.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	C = gmt ('makecpt -C255,100 -T-10/10/10 -N');

	cmd = sprintf('grdcontour %sHI_geoid4.nc', d_path);
	gmt([cmd ' -R195/210/18/25 -Jm0.45i -p60/30 -C1 -A5+o -Gd4i -K -P -X1.25i -Y1.25i > ' ps])
	gmt(['pscoast -R -J -p -B2 -BNEsw -Gblack -O -K -TdjBR+o0.1i+w1i+l >> ' ps])
	gmt([sprintf('grdview %s/HI_topo4.nc', d_path) ' -R195/210/18/25/-6/4 -J -Jz0.34i -p -C -O -K ' ...
		' -N-6+glightgray -Qsm -B2 -Bz2+l"Topo (km)" -BneswZ -Y2.2i >> ' ps], C)
	gmt(['pstext -R0/10/0/10 -Jx1i -F+f60p,ZapfChancery-MediumItalic+jCB -O >> ' ps], {'3.25 5.75 H@#awaiian@# R@#idge@#'})

	ps = [out_path 'example_04c.ps'];
	Gg_intens = gmt(['grdgradient ' d_path 'HI_geoid4.nc -A0 -Nt0.75 -fg']);
	Gt_intens = gmt(['grdgradient ' d_path 'HI_topo4.nc -A0 -Nt0.75 -fg']);
	gmt(['grdimage ' d_path 'HI_geoid4.nc -I -R195/210/18/25 -JM6.75i' ...
		' -p60/30 -C' d_path 'geoid.cpt -E100 -K -P -X1.25i -Y1.25i > ' ps], Gg_intens)
	gmt(['pscoast -R -J -p -B2 -BNEsw -Gblack -O -K >> ' ps])
	gmt(['psbasemap -R -J -p -O -K -TdjBR+o0.1i+w1i+l --COLOR_BACKGROUND=red --FONT=red' ...
		' --MAP_TICK_PEN_PRIMARY=thinner,red >> ' ps])
	gmt(['psscale -R -J -p240/30 -DJBC+o0/0.5i+w5i/0.3i+h -C' d_path 'geoid.cpt -I -O -K -Bx2+l"Geoid (m)" >> ' ps])
	gmt(['grdview ' d_path 'HI_topo4.nc -I -R195/210/18/25/-6/4 -J -C' d_path 'topo.cpt' ...
		' -JZ3.4i -p60/30 -O -K -N-6+glightgray -Qc100 -B2 -Bz2+l"Topo (km)" -BneswZ -Y2.2i >> ' ps], Gt_intens)
	gmt(['pstext -R0/10/0/10 -Jx1i -F+f60p,ZapfChancery-MediumItalic+jCB -O >> ' ps], {'3.25 5.75 H@#awaiian@# R@#idge@#'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex05(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex05/'];
	ps = [out_path 'example_05.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	Gsombrero = gmt('grdmath -R-15/15/-15/15 -I0.3 X Y HYPOT DUP 2 MUL PI MUL 8 DIV COS EXCH NEG 10 DIV EXP MUL =');
	C = gmt('makecpt -C128 -T-5,5 -N');
	Gintensity = gmt('grdgradient -A225 -Nt0.75', Gsombrero);
	gmt(['grdview -JX6i -JZ2i -B5 -Bz0.5 -BSEwnZ -N-1+gwhite -Qs -I -X1.5i' ...
		' -C -R-15/15/-15/15/-1/1 -K -p120/30 > ' ps], Gsombrero, Gintensity, C)
	gmt(['pstext -R0/11/0/8.5 -Jx1i -F+f50p,ZapfChancery-MediumItalic+jBC -O >> ' ps], ...
		{'4.1 5.5 z(r) = cos (2@~p@~r/8) @~\327@~e@+-r/10@+'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex06(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex06/'];
	ps = [out_path 'example_06.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	gmt(['psrose ' d_path 'fractures.txt -: -A10r -S1.8in -P -Gorange -R0/1/0/360 -X2.5i -K -Bx0.2g0.2' ...
		' -By30g30 -B+glightblue -W1p > ' ps])
	gmt(['pshistogram -Bxa2000f1000+l"Topography (m)" -Bya10f5+l"Frequency"+u" %"' ...
		' -BWSne+t"Histograms"+glightblue ' d_path 'v3206.t -R-6000/0/0/30 -JX4.8i/2.4i -Gorange -O' ...
		' -Y5.0i -X-0.5i -L1p -Z1 -W250 >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex07(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex07/'];
	ps = [out_path 'example_07.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	gmt(['pscoast -R-50/0/-10/20 -JM9i -K -Slightblue -GP300/26:FtanBdarkbrown -Dl -Wthinnest' ...
		' -B10 --FORMAT_GEO_MAP=dddF > ' ps])
	gmt(['psxy -R -J -O -K ' d_path '/fz.xy -Wthinner,- >> ' ps])
	gmt(['psxy ' d_path '/quakes.xym -R -J -O -K -h1 -Sci -i0,1,2s0.01 -Gred -Wthinnest >> ' ps])
	gmt(['psxy -R -J -O -K ' d_path '/isochron.xy -Wthin,blue >> ' ps])
	gmt(['psxy -R -J -O -K ' d_path '/ridge.xy -Wthicker,orange >> ' ps])
	gmt(['pslegend -R -J -O -K -DjTR+w2.2i+o0.2i -F+pthick+ithinner+gwhite --FONT_ANNOT_PRIMARY=18p,Times-Italic >> ' ps], ...
		'S 0.1i c 0.08i red thinnest 0.3i ISC Earthquakes')
	gmt(['pstext -R -J -O -F+f30,Helvetica-Bold,white=thin >> ' ps], {'-43 -5 SOUTH' '-43 -8 AMERICA' '-7 11 AFRICA'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex08(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex08/'];
	ps = [out_path 'example_08.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	xyz = gmt(['grd2xyz ' d_path 'guinea_bay.nc']);
	gmt(['psxyz -B1 -Bz1000+l"Topography (m)" -BWSneZ+b+tETOPO5' ...
		' -R-0.1/5.1/-0.1/5.1/-5000/0 -JM5i -JZ6i -p200/30 -So0.0833333ub-5000 -P' ...
		' -Wthinnest -Glightgreen -K > ' ps], xyz)
	gmt(['pstext -R -J -JZ -Z0 -F+f24p,Helvetica-Bold+jTL -p -O >> ' ps], {'0.1 4.9 This is the surface of cube'})

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex09(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex09/'];
	ps = [out_path 'example_09.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	gmt(['pswiggle ' d_path 'tracks.txt -R185/250/-68/-42 -K -Jm0.13i -Ba10f5 -BWSne+g240/255/240 -G+red' ...
		' -G-blue -Z2000 -Wthinnest -S240/-67/500/@~m@~rad --FORMAT_GEO_MAP=dddF > ' ps])
	gmt(['psxy -R -J -O -K ' d_path 'ridge.xy -Wthicker >> ' ps])
	gmt(['psxy -R -J -O -K ' d_path 'fz.xy    -Wthinner,- >> ' ps])
	% Take label from segment header and plot near coordinates of last record of each track
	resp = gmt(['gmtconvert -El ' d_path 'tracks.txt']);
	% Here we have to copy the header text into the text member, and remembering that we are dealing with a struct array
	for (k = 1:length(resp)),	resp(k).text{k} = resp(k).header;	end
	gmt(['pstext -R -J -F+f10p,Helvetica-Bold+a50+jRM+h -D-0.05i/-0.05i -O >> ' ps], resp)
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex10(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex10/'];
	ps = [out_path 'example_10.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	gmt(['pscoast -Rd -JX8id/5id -Dc -Sazure2 -Gwheat -Wfaint -A5000 -p200/40 -K > ' ps])
	fid = fopen([d_path 'languages.txt']);
	str = fread(fid,'*char');
	fclose(fid);
	str = strread(str','%s','delimiter','\n');
	k = 1;
	while (str{k}(1) == '#')
		k = k + 1;
	end
	str = str(k:end);		% Remove the comment lines
	nl = numel(str);
	array = zeros(nl, 7);
	for (k = 1:nl)
		array(k,:) = strread(str{k}, '%f', 7);
	end
	t = cell(nl,1);
	for (k = 1:nl)
		t{k} = sprintf('%d %d %d\n',array(k,1:2),sum(array(k,3:end)));
	end
	gmt(['pstext -R -J -O -K -p -Gwhite@30 -D-0.25i/0 -F+f30p,Helvetica-Bold,firebrick=thinner+jRM >> ' ps], t)
	gmt(['psxyz ' d_path 'languages.txt -R-180/180/-90/90/0/2500 -J -JZ2.5i -So0.3i -Gpurple -Wthinner' ...
		' --FONT_TITLE=30p,Times-Bold --MAP_TITLE_OFFSET=-0.7i -O -K -p --FORMAT_GEO_MAP=dddF' ...
		' -Bx60 -By30 -Bza500+lLanguages -BWSneZ+t"World Languages By Continent" >> ' ps])
	gmt(['psxyz -R -J -JZ -So0.3ib -Gblue -Wthinner -O -K -p >> ' ps], [array(:,1:2) sum(array(:,3:4),2) array(:,3)])
	gmt(['psxyz -R -J -JZ -So0.3ib -Gdarkgreen -Wthinner -O -K -p >> ' ps], [array(:,1:2) sum(array(:,3:5),2) sum(array(:,3:4),2)])
	gmt(['psxyz -R -J -JZ -So0.3ib -Gyellow -Wthinner -O -K -p >> ' ps], [array(:,1:2) sum(array(:,3:6),2) sum(array(:,3:5),2)])
	gmt(['psxyz -R -J -JZ -So0.3ib -Gred -Wthinner -O -K -p >> ' ps], [array(:,1:2) sum(array(:,3:7),2) sum(array(:,3:6),2)])
	gmt(['pslegend -R -J -JZ -DjLB+o0.2i+w1.35i/0+jBL -O --FONT=Helvetica-Bold' ...
		' -F+glightgrey+pthinner+s-4p/-6p/grey20@40 -p ' d_path 'legend.txt >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex11(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex11/'];
	ps = [out_path 'example_11.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% Use gmt psxy to plot "cut-along-the-dotted" lines.

	gmt('set MAP_TICK_LENGTH_PRIMARY 0 FONT_ANNOT_PRIMARY 12p,Helvetica-Bold PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt('destroy')

	gmt(['psxy ' d_path 'cut-here.txt -Wthinnest,. -R-51/306/0/1071 -JX3.5i/10.5i -X2.5i -Y0.5i -P -K > ' ps])

	% First, create grids of ascending X and Y and constant 0.
	% These are to be used to represent R, G and B values of the darker 3 faces of the cube.
	x_nc = gmt('grdmath -I1 -R0/255/0/255 X =');
	y_nc = gmt('grdmath -I1 -R Y =');
	c_nc = gmt('grdmath -I1 -R 0 =');

	gmt(['grdimage -JX2.5i/-2.5i -R -K -O -X0.5i >> ' ps], x_nc, y_nc, c_nc)
	gmt(['psxy -Wthinner,white,- ' d_path 'rays.txt -J -R -K -O >> ' ps])
	gmt(['pstext --FONT=white -J -R -K -O -F+f+a >> ' ps], ...
		{'128 128 12p -45 60\217'
		 '102  26 12p -90 0.4'
		 '204  26 12p -90 0.8'
		 '10  140 16p 180 G'})
	gmt(['psxy -N -Sv0.15i+s+e -Gwhite -W2p,white -J -R -K -O >> ' ps], [0 0 0 128])

	gmt(['grdimage -JX2.5i/2.5i -R -K -O -Y2.5i >> ' ps], x_nc, c_nc, y_nc)
	gmt(['psxy -Wthinner,white,- ' d_path 'rays.txt -J -R -K -O >> ' ps])
	gmt(['pstext --FONT=white -J -R -K -O -F+f+a >> ' ps], ...
		{'128 128 12p  45 300\217'
		 '26  102 12p   0 0.4'
		 '26  204 12p   0 0.8'
		 '140  10 16p -90 R'
		 '100 100 16p -45 V'})

	gmt(['psxy -N -Sv0.15i+s+e -Gwhite -W2p,white -J -R -K -O >> ' ps], [0 0 128 0])
	gmt(['psxy -N -Sv0.15i+s+e -Gwhite -W2p,white -J -R -K -O >> ' ps], [0 0 90 90])

	gmt(['grdimage -JX-2.5i/2.5i -R -K -O -X-2.5i >> ' ps], c_nc, x_nc, y_nc)
	gmt(['psxy -Wthinner,white,- ' d_path 'rays.txt -J -R -K -O >> ' ps])
	gmt(['pstext --FONT=white -J -R -K -O -F+f+a >> ' ps], ...
		{'128 128 12p 135 180\217'
		 '102  26 12p  90 0.4'
		 '204  26 12p  90 0.8'
		 '10  140 16p   0 B'})

	gmt(['psxy -N -Sv0.15i+s+e -Gwhite -W2p,white -J -R -K -O >> ' ps], [0 0 0 128])
	gmt(['psxy -N -Sv0.15i+s+e -Gwhite -W2p,white -J -R -K -O >> ' ps], [0 0 128 0])

	% Second, create grids of descending X and Y and constant 255.
	% These are to be used to represent R, G and B values of the lighter 3 faces of the cube.

	x_nc = gmt('grdmath -I1 -R 255 X SUB =');
	y_nc = gmt('grdmath -I1 -R 255 Y SUB =');
	c_nc = gmt('grdmath -I1 -R 255       =');

	gmt(['grdimage -JX-2.5i/-2.5i -R -K -O -X2.5i -Y2.5i >> ' ps], x_nc, y_nc, c_nc)
	gmt(['psxy -Wthinner,black,- ' d_path 'rays.txt -J -R -K -O >> ' ps])
	gmt(['pstext -J -R -K -O -F+f+a >> ' ps], ...
		{'128 128 12p 225 240\217'
		 '102  26 12p 270 0.4'
		 '204  26 12p 270 0.8'})

	gmt(['grdimage -JX2.5i/-2.5i -R -K -O -X2.5i >> ' ps], c_nc, y_nc, x_nc)
	gmt(['psxy -Wthinner,black,- ' d_path 'rays.txt -J -R -K -O >> ' ps])
	gmt(['pstext -J -R -K -O -F+f+a >> ' ps], ...
		{'128 128 12p -45 0\217'
		 '26  102 12p   0 0.4'
		 '26  204 12p   0 0.8'
		 '100 100 16p  45 S'
		 '204  66 16p  90 H'})

	gmt(['psxy -N -Sv0.15i+s+e -Gblack -W2p -J -R -K -O >> ' ps], [0 0 90 90])
	gmt(['psxy -N -Sv0.15i+s+e -Gblack -W2p -J -R -K -O >> ' ps], [204 204 204 76])

	gmt(['grdimage -JX-2.5i/2.5i -R -K -O -X-2.5i -Y2.5i >> ' ps], x_nc, c_nc, y_nc)
	gmt(['psxy -Wthinner,black,- ' d_path 'rays.txt -J -R -K -O >> ' ps])
	gmt(['pstext -J -R -O -F+f+a >> ' ps], ...
		{'128 128 12p 135 120\217'
		 '26  102 12p 180 0.4'
		 '26  204 12p 180 0.8'
		 '200 200 16p 225 GMT 5'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex12(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex12/'];
	ps = [out_path 'example_12.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	net_xy = gmt(['triangulate ' d_path 'table_5.11 -M']);
	gmt(['psxy -R0/6.5/-0.2/6.5 -JX3.06i/3.15i -B2f1 -BWSNe -Wthinner -P -K -X0.9i -Y4.65i > ' ps], net_xy)
	gmt(['psxy ' d_path 'table_5.11 -R -J -O -K -Sc0.12i -Gwhite -Wthinnest >> ' ps])
	gmt(['pstext -R -J -F+f6p+r -O -K ' d_path 'table_5.11 >> ' ps])

	% Then draw network and print the node values
	gmt(['psxy -R -J -B2f1 -BeSNw -Wthinner -O -K -X3.25i >> ' ps], net_xy)
	gmt(['psxy -R -J -O -K ' d_path 'table_5.11 -Sc0.03i -Gblack >> ' ps])
	gmt(['pstext ' d_path 'table_5.11 -R -J -F+f6p+jLM -O -K -Gwhite -W -C0.01i -D0.08i/0i -N >> ' ps])

	% Then contour the data and draw triangles using dashed pen; use "gmt gmtinfo" and "gmt makecpt" to make a
	% color palette (.cpt) file
	T = gmt(['info -T25/2 ' d_path 'table_5.11']);
	topo_cpt = gmt(['makecpt -Cjet ' T.text{1}]);
	gmt(['pscontour -R -J ' d_path 'table_5.11 -B2f1 -BWSne -Wthin -C -Lthinnest,-' ...
		' -Gd1i -X-3.25i -Y-3.65i -O -K >> ' ps], topo_cpt)

	% Finally color the topography
	gmt(['pscontour -R -J ' d_path 'table_5.11 -B2f1 -BeSnw -C -I -X3.25i -O -K >> ' ps], topo_cpt)
	gmt(['pstext -R0/8/0/11 -Jx1i -F+f30p,Helvetica-Bold+jCB -O -X-3.25i >> ' ps], {'3.16 8 Delaunay Triangulation'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex13(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex13/'];
	ps = [out_path 'example_13.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	Gz = gmt('grdmath -R-2/2/-2/2 -I0.1 X Y R2 NEG EXP X MUL =');
	Gdzdx = gmt('grdmath ? DDX', Gz);
	Gdzdy = gmt('grdmath ? DDY', Gz);
	gmt(['grdcontour -JX3i -B1 -BWSne -C0.1 -A0.5 -K -P -Gd2i -S4 -T+d0.1i/0.03i > ' ps], Gdzdx)
	gmt(['grdcontour -J -B -C0.05 -A0.2 -O -K -Gd2i -S4 -T+d0.1i/0.03i -Xa3.45i >> ' ps], Gdzdy)
	gmt(['grdcontour -J -B -C0.05 -A0.1 -O -K -Gd2i -S4 -T+d0.1i/0.03i -Y3.45i >> ' ps], Gz)
	gmt(['grdcontour -J -B -C0.05 -O -K -Gd2i -S4 -X3.45i >> ' ps], Gz)
	gmt(['grdvector -I0.2 -J -O -K -Q0.1i+e+n0.25i -Gblack -W1p -S5i --MAP_VECTOR_SHAPE=0.5 >> ' ps], Gdzdx, Gdzdy)
	gmt('destroy')
	gmt(['pstext -R0/6/0/4.5 -Jx1i -F+f40p,Times-Italic+jCB -O -X-3.45i >> ' ps], ...
		{'3.2 3.6 z(x,y) = x@~\327@~exp(-x@+2@+-y@+2@+)'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex14(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex14/'];
	ps = [out_path 'example_14.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	D = gmt(['read ' d_path 'table_5.11 -Td']);
	% First draw network and label the nodes
	gmt('set MAP_GRID_PEN_PRIMARY thinnest,- PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt('destroy')
	gmt(['psxy -R0/7/0/7 -JX3.06i/3.15i -B2f1 -BWSNe -Sc0.05i -Gblack -P -K -Y6.45i > ' ps], D)
	gmt(['pstext -R -J -D0.1c/0 -F+f6p+jLM -O -K -N >> ' ps], D)
	mean_xyz = gmt('blockmean -R0/7/0/7 -I1', D);

	% Then draw gmt blockmean cells
	gmt(['psbasemap -R0.5/7.5/0.5/7.5 -J -O -K -Bg1 -X3.25i >> ' ps])
	gmt(['psxy -R0/7/0/7 -J -B2f1 -BeSNw -Ss0.05i -Gblack -O -K >> ' ps], mean_xyz)
	% Reformat to one decimal for annotation purposes
	t = cellstr(num2str(mean_xyz.data,'%g %g %.1f'));	% Round to nearest 0.1 and convert to cells
	gmt(['pstext -R -J -D0.15c/0 -F+f6p+jLM -O -K -Gwhite -W -C0.01i -N >> ' ps], t)

	% Then gmt surface and contour the data
	Gdata = gmt('surface -R -I1', mean_xyz);
	gmt(['grdcontour -J -B2f1 -BWSne -C25 -A50 -Gd3i -S4 -O -K -X-3.25i -Y-3.55i >> ' ps], Gdata)
	gmt(['psxy -R -J -Ss0.05i -Gblack -O -K >> ' ps], mean_xyz)

	% Fit bicubic trend to data and compare to gridded gmt surface
	Gtrend = gmt('grdtrend -N10 -T', Gdata);
	track  = gmt('project -C0/0 -E7/7 -G0.1 -N');
	gmt(['grdcontour -J -B2f1 -BwSne -C25 -A50 -Glct/cb -S4 -O -K -X3.25i >> ' ps], Gtrend)
	gmt(['psxy -R -J -Wthick,. -O -K >> ' ps], track)

	% Sample along diagonal
	data  = gmt('grdtrack -G -o2,3', track, Gdata);
	trend = gmt('grdtrack -G -o2,3', track, Gtrend);
	t = gmt('info -I0.5/25', data, trend);
	gmt(['psxy -JX6.3i/1.4i ' t.text{1} ' -Wthick -O -K -X-3.25i -Y-1.9i -Bx1 -By50 -BWSne >> ' ps], data)
	gmt(['psxy -R -J -Wthinner,- -O >> ' ps], trend)
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex15(g_root_dir, out_path, verbose)
% THIS EXAMPLE FAILS TO PLOT THE STAR AT THE MINIMUM AT UR FIG (grdinfo gives wrong info)
	d_path = [g_root_dir 'doc/examples/ex15/'];
	ps = [out_path 'example_15.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	ship_d = gmt(['read -Td ' d_path '/ship.xyz']);

	region = gmt('info -I1', ship_d);
	region = region.text{1};				% We want this to be astring, not a cell
	Gship  = gmt(['nearneighbor ' region ' -I10m -S40k'], ship_d);
	gmt(['grdcontour -JM3i -P -B2 -BWSne -C250 -A1000 -Gd2i -K > ' ps], Gship)

	ship_10m = gmt(['blockmedian ' region ' -I10m'], ship_d);
	Gship = gmt(['surface ' region ' -I10m'], ship_10m);
	gmt(['psmask ' region ' -I10m -J -O -K -T -Glightgray -X3.6i >> ' ps], ship_d)
	gmt(['grdcontour -J -B -C250 -L-8000/0 -A1000 -Gd2i -O -K >> ' ps], Gship)

	gmt(['psmask ' region ' -I10m -J -B -O -K -X-3.6i -Y3.75i >> ' ps], ship_10m)
	gmt(['grdcontour -J -C250 -A1000 -L-8000/0 -Gd2i -O -K >> ' ps], Gship)
	gmt(['psmask -C -O -K >> ' ps])

	Gship_clipped = gmt('grdclip -Sa-1/NaN', Gship);
	gmt(['grdcontour -J -B -C250 -A1000 -L-8000/0 -Gd2i -O -K -X3.6i >> ' ps], Gship_clipped)
	gmt(['pscoast ' region ' -J -O -K -Ggray -Wthinnest >> ' ps])
	info = gmt('grdinfo -C -M', Gship);
	gmt(['psxy -R -J -O -K -Sa0.15i -Wthick >> ' ps], info.data(11:12))
	gmt(['pstext -R0/3/0/4 -Jx1i -F+f24p,Helvetica-Bold+jCB -O -N >> ' ps], '-0.3 3.6 Gridding with missing data')
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex16(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex16/'];
	ps = [out_path 'example_16.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set FONT_ANNOT_PRIMARY 9p PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt('destroy')
	gmt(['pscontour -R0/6.5/-0.2/6.5 -Jx0.45i -P -K -Y5.5i -Ba2f1 -BWSne ' d_path 'table_5.11 -C' d_path 'ex16.cpt -I > ' ps])
	gmt(['pstext -R -J -O -K -N -F+f18p,Times-Roman+jCB >> ' ps], {'3.25 7 pscontour (triangulate)'})

	Graws0 = gmt(['surface ' d_path 'table_5.11 -R -I0.2']);
	gmt(['grdview -R -J -B -C' d_path 'ex16.cpt -Qs -O -K -X3.5i >> ' ps], Graws0)
	gmt(['pstext -R -J -O -K -N -F+f18p,Times-Roman+jCB >> ' ps], {'3.25 7 surface (tension = 0)'})

	Graws5 = gmt(['surface ' d_path 'table_5.11 -R -I0.2 -G -T0.5']);
	gmt(['grdview -R -J -B -C' d_path 'ex16.cpt -Qs -O -K -Y-3.75i -X-3.5i >> ' ps], Graws5)
	gmt(['pstext -R -J -O -K -N -F+f18p,Times-Roman+jCB >> ' ps], {'3.25 7 surface (tension = 0.5)'})

	Grawt = gmt(['triangulate ' d_path 'table_5.11 -G -R -I0.2']);
	Gfiltered = gmt('grdfilter -G -D0 -Fc1', Grawt);
	gmt(['grdview -R -J -B -C' d_path 'ex16.cpt -Qs -O -K -X3.5i >> ' ps], Gfiltered)
	gmt('destroy')
	gmt(['pstext -R -J -O -K -N -F+f18p,Times-Roman+jCB >> ' ps], {'3.25 7 triangulate @~\256@~ grdfilter'})
	gmt(['pstext -R0/10/0/10 -Jx1i -O -K -N -F+f32p,Times-Roman+jCB -X-3.5i >> ' ps], {'3.2125 7.5 Gridding of Data'})
	gmt(['psscale -Dx3.25i/0.35i+jTC+w5i/0.25i+h -C' d_path 'ex16.cpt -O -Y-0.75i >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex17(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex17/'];
	ps = [out_path 'example_17.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% First generate geoid image w/ shading
	gmt('set -Du')
	gmt('destroy')
	geoid_cpt = gmt(['grd2cpt ' d_path 'india_geoid.nc -Crainbow']);
	Gindia_geoid_i = gmt(['grdgradient ' d_path 'india_geoid.nc -Nt1 -A45 -G']);
	gmt(['grdimage ' d_path '/india_geoid.nc -I -JM6.5i -C -P -K > ' ps], Gindia_geoid_i, geoid_cpt)

	% Then use gmt pscoast to initiate clip path for land
	gmt(['pscoast -R' d_path 'india_geoid.nc -J -O -K -Dl -Gc >> ' ps])

	% Now generate topography image w/shading
	C = gmt('makecpt -C150 -T-10000,10000 -N');
	Gindia_topo_i = gmt(['grdgradient ' d_path 'india_topo.nc -Nt1 -A45 -G']);
	gmt(['grdimage ' d_path 'india_topo.nc -I -J -C -O -K >> ' ps], Gindia_topo_i, C)

	% Finally undo clipping and overlay basemap
	gmt(['pscoast -R -J -O -K -Q -B10f5 -B+t"Clipping of Images" >> ' ps])

	%Put a color legend on top of the land mask
	gmt(['psscale -DjTR+o0.3i/0.1i+w4i/0.2i+h -R -J -C -Bx5f1 -By+lm -I -O -K >> ' ps], geoid_cpt)

	% Add a text paragraph
	t = {'> 90 -10 12p 3i j' ...
		'@_@%5%Example 17.@%%@_  We first plot the color geoid image' ...
		'for the entire region, followed by a gray-shaded @#etopo5@#' ...
		'image that is clipped so it is only visible inside the coastlines.'};
	gmt(['pstext -R -J -O -M -Gwhite -Wthinner -TO -D-0.1i/0.1i -F+f12,Times-Roman+jRB >> ' ps], t)
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex18(g_root_dir, out_path, verbose)
% 
	d_path = [g_root_dir 'doc/examples/ex18/'];
	ps = [out_path 'example_18.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% Use spherical gmt projection since SS data define on sphere
	gmt('set PROJ_ELLIPSOID Sphere FORMAT_FLOAT_OUT %g PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt('destroy')

	% Define location of Pratt seamount and the 400 km diameter
	pratt = [-142.65 56.25 400];

	% First generate gravity image w/ shading, label Pratt, and draw a circle
	% of radius = 200 km centered on Pratt.

	grav_cpt = gmt('makecpt -Crainbow -T-60/60');
	GAK_gulf_grav_i = gmt(['grdgradient ' d_path 'AK_gulf_grav.nc -Nt1 -A45']);
	gmt(['grdimage ' d_path 'AK_gulf_grav.nc -I -JM5.5i -C -B2f1 -P -K -X1.5i' ...
		' -Y5.85i > ' ps], GAK_gulf_grav_i, grav_cpt)
	gmt(['pscoast -R' d_path 'AK_gulf_grav.nc -J -O -K -Di -Ggray -Wthinnest >> ' ps])
	gmt(['psscale -DJBC+o0/0.4i+w4i/0.15i+h -R -J -C -Bx20f10 -By+l"mGal" -O -K >> ' ps], grav_cpt)
	gmt(['pstext -R -J -O -K -D0.1i/0.1i -F+f12p,Helvetica-Bold+jLB >> ' ps], {sprintf('%f %f Pratt', pratt(1), pratt(2))})
	gmt(['psxy -R -J -O -K -SE- -Wthinnest >> ' ps], pratt)

	% Then draw 10 mGal contours and overlay 50 mGal contour in green
	gmt(['grdcontour ' d_path 'AK_gulf_grav.nc -J -C20 -B2f1 -BWSEn -O -K -Y-4.85i >> ' ps])
	% Save 50 mGal contours to individual files, then plot them
	gmt(['grdcontour ' d_path 'AK_gulf_grav.nc -C10 -L49/51 -Dsm_%c.txt'])
	gmt(['psxy -R -J -O -K -Wthin,green sm_C.txt >> ' ps])
	gmt(['psxy -R -J -O -K -Wthin,green sm_O.txt >> ' ps])
	gmt(['pscoast -R -J -O -K -Di -Ggray -Wthinnest >> ' ps])
	gmt(['psxy -R -J -O -K -SE- -Wthinnest >> ' ps], pratt)

	% Now determine centers of each enclosed seamount > 50 mGal but only plot
	% the ones within 200 km of Pratt seamount.

	% First determine mean location of each closed contour and add it to the file centers.txt
	centers = gmt('gmtspatial -Q -fg sm_C.txt');

	% Only plot the ones within 200 km
	t = gmt('gmtselect -C+d200k -fg', centers, pratt);
	gmt(['psxy -R -J -O -K -SC0.04i -Gred -Wthinnest >> ' ps], t)
	gmt(['psxy -R -J -O -K -ST0.1i -Gyellow -Wthinnest >> ' ps], pratt)

	% Then report the volume and area of these seamounts only by masking out data outside
	% the 200 km-radius circle and then evaluate area/volume for the 50 mGal contour

	Gmask = gmt(['grdmath -R ' sprintf('%f %f', pratt(1), pratt(2)) ' SDIST =']);
	Gmask = gmt('grdclip -Sa200/NaN -Sb200/1', Gmask);
	Gtmp = gmt(['grdmath ' d_path 'AK_gulf_grav.nc ? MUL ='], Gmask);
	area = gmt('grdvolume -C50 -Sk', Gtmp); % | cut -f2`
	volume = gmt('grdvolume -C50 -Sk', Gtmp); % | cut -f3`

	gmt(['pstext -R -J -O -M -Gwhite -Wthin -Dj0.3i -F+f14p,Helvetica-Bold+jLB -C0.1i >> ' ps], ...
 		{'> -149 52.5 14p 2.6i j'
		 sprintf('Volumes: %.0f mGal\264km@+2@+', volume.data(3))
 		 ''
		 sprintf('Areas: %.2f km@+2@+', area.data(2))})
	builtin('delete', 'sm_*.txt')
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex19(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex19/'];
	ps = [out_path 'example_19.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% First make a worldmap with graded blue oceans and rainbow continents
	gmt('set -Du')
	gmt('destroy')
	Glat = gmt('grdmath -Rd -I1 -r Y COSD 2 POW =');
	Glon = gmt('grdmath -Rd -I1 -r X =');
	Clat = gmt('makecpt -Cwhite,blue -T0,1 -Z -N');
	lon_cpt = gmt('makecpt -Crainbow -T-180/180');
	gmt(['grdimage -JI0/6.5i -C -P -K -Y7.5i -B0 -nl > ' ps], Glat, Clat)
	gmt(['pscoast -R -J -O -K -Dc -A5000 -Gc >> ' ps])
	gmt(['grdimage -J -C -O -K -nl >> ' ps], Glon, lon_cpt)
	gmt(['pscoast -R -J -O -K -Q >> ' ps])
	gmt(['pscoast -R -J -O -K -Dc -A5000 -Wthinnest >> ' ps])
	gmt(['pstext -R -J -O -K -F+f32p,Helvetica-Bold,red=thinner >> ' ps], {'0 20 13TH INTERNATIONAL'})
	gmt(['pstext -R -J -O -K -F+f32p,Helvetica-Bold,red=thinner >> ' ps], {'0 -10 GMT CONFERENCE'})
	gmt(['pstext -R -J -O -K -F+f18p,Helvetica-Bold,green=thinnest >> ' ps], {'0 -30 Honolulu, Hawaii, April 1, 2017'})

	% Then show example of color patterns and placing a PostScript image
	gmt(['pscoast -R -J -O -K -Dc -A5000 -Gp100/86:FredByellow -Sp100/' d_path 'circuit.ras -B0 -Y-3.25i >> ' ps])
	gmt(['pstext -R -J -O -K -F+f32p,Helvetica-Bold,lightgreen=thinner >> ' ps], {'0 30 SILLY USES OF'})
	gmt(['pstext -R -J -O -K -F+f32p,Helvetica-Bold,magenta=thinner >> ' ps], {'0 -30 COLOR PATTERNS'})
	gmt(['psimage -DjCM+w3i -R -J ' d_path 'GMT_covertext.eps -O -K >> ' ps])

	% Finally repeat 1st plot but exchange the patterns
	gmt(['grdimage -J -C -O -K -Y-3.25i -B0 -nl >> ' ps], Glon, lon_cpt)
	gmt(['pscoast -R -J -O -K -Dc -A5000 -Gc >> ' ps])
	gmt(['grdimage -J -C -O -K -nl >> ' ps], Glat, Clat)
	gmt(['pscoast -R -J -O -K -Q >> ' ps])
	gmt(['pscoast -R -J -O -K -Dc -A5000 -Wthinnest >> ' ps])
	gmt(['pstext -R -J -O -K -F+f32p,Helvetica-Bold,red=thinner >> ' ps], {'0 20 13TH INTERNATIONAL'})
	gmt(['pstext -R -J -O -K -F+f32p,Helvetica-Bold,red=thinner >> ' ps], {'0 -10 GMT CONFERENCE'})
	gmt(['pstext -R -J -O -F+f18p,Helvetica-Bold,green=thinnest >> ' ps], {'0 -30 Honolulu, Hawaii, April 1, 2017'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex20(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex20/'];
	ps = [out_path 'example_20.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	fogspots = [
		55.5	-21.0	0.25
		63.0	-49.0	0.25
		-12.0	-37.0	0.25
		-28.5	29.34	0.25
		48.4	-53.4	0.25
		155.5	-40.4	0.25
		-155.5	19.6	0.5
		-138.1	-50.9	0.25
		-153.5	-21.0	0.25
		-116.7	-26.3	0.25
		-16.5	64.4	0.25];

	gmt('set -Du')
	gmt('destroy')
	gmt(['pscoast -Rg -JR9i -Bx60 -By30 -B+t"Hotspot Islands and Cities" -Gdarkgreen -Slightblue -Dc -A5000 -K > ' ps])
	gmt(['psxy -R -J -Skvolcano -O -K -Wthinnest -Gred >> ' ps], fogspots)

	% Overlay a few bullseyes at NY, Cairo, and Perth
	cities = [286 40.45 0.8; 31.15 30.03 0.8; 115.49 -31.58 0.8];
	gmt(['psxy -R -J -Sk' d_path 'bullseye -O >> ' ps], cities)
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex21(g_root_dir, out_path, verbose)
% THIS EXAMPLE ORIGINALY WOULD FAIL BECAUSE gmtinfo -C -fT returns a double and not a string
	d_path = [g_root_dir 'doc/examples/ex21/'];
	ps = [out_path 'example_21.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% File has time stored as dd-Mon-yy so set input format to match it
	gmt(['set FORMAT_DATE_IN dd-o-yy FORMAT_DATE_MAP o FONT_ANNOT_PRIMARY +10p' ...
		' FORMAT_TIME_PRIMARY_MAP abbreviated PS_CHAR_ENCODING ISOLatin1+ PROJ_LENGTH_UNIT inch PS_MEDIA letter'])
	gmt('destroy')

	% Pull out a suitable region string in yyy-mm-dd format
	R = gmt(['info -fT -I50 ' d_path 'RHAT_price.csv']);		% The output is a cell
	R = R.text{1};
	ind = strfind(R, '/');
	wT = R(3:ind(1)-1);				% West and East in T time coordinates (to be used later)
	eT = R(ind(1)+1:ind(2)-1);
	sF = R(ind(2)+1:ind(3)-1);

	% Lay down the basemap:
	gmt(['psbasemap ' R ' -JX9i/6i -K -Bsx1Y -Bpxa3Of1o -Bpy50+p"\044 "' ...
		' -BWSen+t"RedHat (RHT) Stock Price Trend since IPO"+glightgreen > ' ps])

	% Plot main window with open price as red line over yellow envelope of low/highs

	RHAT1_env = gmt(['gmtconvert -o0,2 -f0T ' d_path 'RHAT_price.csv']);
	RHAT2_env = gmt(['gmtconvert -o0,3 -f0T -I -T ' d_path 'RHAT_price.csv']);
	RHAT_env = [RHAT1_env; RHAT2_env];
	gmt(['psxy -R -J -Gyellow -O -K >> ' ps], RHAT_env)
	gmt(['psxy -R -J ' d_path 'RHAT_price.csv -Wthin,red -O -K >> ' ps])

	% Draw P Wessel's purchase price as line and label it.  Note we temporary switch
	% back to default yyyy-mm-dd format since that is what gmt info gave us.
	fid = fopen('RHAT.pw','w');
	fprintf(fid, '05-May-00 0\n');
	fprintf(fid, '05-May-00 300\n');
	fclose(fid);
	gmt(['psxy -R -J RHAT.pw -Wthinner,- -O -K >> ' ps])
	fid = fopen('RHAT.pw','w');
	fprintf(fid, '01-Jan-99 25\n');
	fprintf(fid, '01-Jan-02 25\n');
	fclose(fid);
	gmt(['psxy -R -J RHAT.pw -Wthick,- -O -K >> ' ps])
	gmt(['pstext -R -J -O -K -D1.5i/0.05i -N -F+f12p,Bookman-Demi+jLB --FORMAT_DATE_IN=yyyy-mm-dd >> ' ps], {[wT ' 25 PW buy']})

	% Draw P Wessel's sales price as line and label it.
	fid = fopen('RHAT.pw','w');
	fprintf(fid, '25-Jun-07 0\n');
	fprintf(fid, '25-Jun-07 300\n');
	fclose(fid);
	gmt(['psxy -R -J RHAT.pw -Wthinner,- -O -K >> ' ps])
	fid = fopen('RHAT.pw','w');
	fprintf(fid, '01-Aug-06 23.8852\n');
	fprintf(fid, '01-Jan-08 23.8852\n');
	fclose(fid);
	gmt(['psxy -R -J RHAT.pw -Wthick,- -O -K >> ' ps])
	gmt(['pstext -R -J -O -K -Dj0.8i/0.05i -N -F+f12p,Bookman-Demi+jRB --FORMAT_DATE_IN=yyyy-mm-dd >> ' ps], {[eT ' 23.8852 PW sell']})

	% Get smaller region for insert for trend since 2004
	R = sprintf('-R2004T/%s/%s/40', eT, sF);

	% Lay down the basemap, using Finnish annotations and place the insert in the upper right
	gmt(['psbasemap --GMT_LANGUAGE=fi ' R ' -JX6i/3i -Bpxa3Of3o -Bpy10+p"\044 " -BESw+glightblue -Bsx1Y' ...
		' -O -K -X3i -Y3i >> ' ps])

	% Again, plot close price as red line over yellow envelope of low/highs

	gmt(['psxy -R -J -Gyellow -O -K >> ' ps], RHAT_env(1).data)
	gmt(['psxy -R -J ' d_path 'RHAT_price.csv -Wthin,red -O -K >> ' ps])

	% Draw P Wessel's sales price as dashed line
	gmt(['psxy -R -J RHAT.pw -Wthick,- -O -K >> ' ps])

	% Mark sales date
	fid = fopen('RHAT.pw','w');
	fprintf(fid, '25-Jun-07	0\n');
	fprintf(fid, '25-Jun-07	300\n');
	fclose(fid);
	gmt(['psxy -R -J RHAT.pw -Wthinner,- -O >> ' ps])

	builtin('delete','RHAT.pw');
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex22(g_root_dir, out_path, verbose)
% THIS EXAMPLE ...
	d_path = [g_root_dir 'doc/examples/ex22/'];
	ps = [out_path 'example_22.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt(['set FONT_ANNOT_PRIMARY 10p FONT_TITLE 18p FORMAT_GEO_MAP ddd:mm:ssF' ...
		' PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter'])
	gmt('destroy')

	% Get the data (-q quietly) from USGS using the wget (comment out in case
	% your system does not have wget or curl)
	% 
	% wget http://neic.usgs.gov/neis/gis/bulletin.asc -q -O neic_quakes.txt
	% curl http://neic.usgs.gov/neis/gis/bulletin.asc -s > neic_quakes.txt
	% 
	% Count the number of events (to be used in title later. one less due to header)

	% n=`cat neic_quakes.txt | wc -l`
	% n=`expr $n - 1`
	n = 77;
	
	% Pull out the first and last timestamp to use in legend title

	% first=`sed -n 2p neic_quakes.txt | awk -F, '{printf "%s %s\n", $1, $2}'`
	% last=`sed -n '$p' neic_quakes.txt | awk -F, '{printf "%s %s\n", $1, $2}'`
	first = '04/04/19 00:04:33';
	last  = '04/04/25 11:11:33';

	% Assign a string that contains the current user @ the current computer node.
	% Note that two @@ is needed to print a single @ in gmt pstext:

	% set me = "$user@@`hostname`"
	me = 'GMT guru @@ GMTbox';

	% Create standard seismicity color table

	neis = gmt('makecpt -Cred,green,blue -T0,100,300,10000 -N');

	% Start plotting. First lay down map, then plot quakes with size = magintude/50":

	gmt(['pscoast -Rg -JK180/9i -B45g30 -B+t"World-wide earthquake activity" -Gbrown -Slightblue -Dc -A1000 -K -Y2.75i > ' ps])
	%gawk -F, "{ print $4, $3, $6, $5*0.02}" neic_quakes.txt |
	t = gmt(['gmtconvert -h ' d_path 'neic_quakes.txt -i3,2,5,4']);
	gmt(['psxy -R -JK -O -K -C -Sci -Wthin >> ' ps], [t.data(:,1:3) t.data(:,4)*0.02], neis)

	% Create legend input file for NEIS quake plot
	neis_legend = ...
	{sprintf('H 16 1 %d events during %s to %s', n, first, last)
	 'D 0 1p'
	 'N 3'
	 'V 0 1p'
	 'S 0.1i c 0.1i red 0.25p 0.2i Shallow depth (0-100 km)'
	 'S 0.1i c 0.1i green 0.25p 0.2i Intermediate depth (100-300 km)'
	 'S 0.1i c 0.1i blue 0.25p 0.2i Very deep (> 300 km)'
	 'D 0 1p'
	 'V 0 1p'
	 'N 7'
	 'V 0 1p'
	 'S 0.1i c 0.06i - 0.25p 0.3i M 3'
	 'S 0.1i c 0.08i - 0.25p 0.3i M 4'
	 'S 0.1i c 0.10i - 0.25p 0.3i M 5'
	 'S 0.1i c 0.12i - 0.25p 0.3i M 6'
	 'S 0.1i c 0.14i - 0.25p 0.3i M 7'
	 'S 0.1i c 0.16i - 0.25p 0.3i M 8'
	 'S 0.1i c 0.18i - 0.25p 0.3i M 9'
	 'D 0 1p'
	 'V 0 1p'
	 'N 1'
	 'G 0.25l'
	 'P'
	 'T USGS/NEIS most recent earthquakes for the last seven days. The data were'
	 'T obtained automatically from the USGS Earthquake Hazards Program page at'
	 'T @_http://neic/usgs.gov @_. Interested users may also receive email alerts'
	 'T from the USGS.'
	 'T This script can be called daily to update the latest information.'
	 'G 0.4i'
	 % Add USGS logo
	 ['I ' d_path 'USGS.ras 1i RT']
	 'G -0.3i'
	 sprintf('L 12 6 LB %s', me)};
	 
	% OK, now we can actually run gmt pslegend.  We center the legend below the map.
	% Trial and error shows that 1.7i is a good legend height:
	gmt(['pslegend -DJBC+o0/0.4i+w7i/1.7i -R -J -O -F+p+glightyellow >> ' ps], neis_legend)
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex23(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex23/'];
	ps = [out_path 'example_23.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% Position and name of central point:
	lon  = 12.50;	lat  = 41.99;
	name = 'Rome';

	gmt('set -Du')
	gmt('destroy')
	Gdist = gmt(sprintf('grdmath -Rg -I1 %f %f SDIST', lon, lat));

	gmt(['pscoast -Rg -JH90/9i -Glightgreen -Sblue -A1000 -Dc -Bg30 -B+t"Distances from ' ...
		name ' to the World" -K -Wthinnest > ' ps])

	gmt(['grdcontour -A1000+v+u" km"+fwhite -Glz-/z+ -S8 -C500 -O -K -JH90/9i -Wathin,white ' ...
		' -Wcthinnest,white,- >> ' ps], Gdist)
	
	% Location info for 5 other cities + label justification
	cities = cell(5,1);
	cities{1} = '105.87 21.02 LM HANOI';
	cities{2} = '282.95 -12.1 LM LIMA';
	cities{3} = '178.42 -18.13 LM SUVA';
	cities{4} = '237.67 47.58 RM SEATTLE';
	cities{5} = '28.20 -25.75 LM PRETORIA';
	fid = fopen('cities.txt','w');
	for (k = 1:5)
		fprintf(fid, '%s\n', cities{k});
	end
	fclose(fid);

	% For each of the cities, plot great circle arc to Rome with gmt psxy
	gmt(['psxy -R -J -O -K -Wthickest,red >> ' ps], [lon lat; 105.87 21.02])
	gmt(['psxy -R -J -O -K -Wthickest,red >> ' ps], [lon lat; 282.95 -12.1])
	gmt(['psxy -R -J -O -K -Wthickest,red >> ' ps], [lon lat; 178.42 -18.13])
	gmt(['psxy -R -J -O -K -Wthickest,red >> ' ps], [lon lat; 237.67 47.58])
	gmt(['psxy -R -J -O -K -Wthickest,red >> ' ps], [lon lat; 28.20 -25.75])

	% Plot red squares at cities and plot names:
	gmt(['psxy -R -J -O -K -Ss0.2 -Gred -Wthinnest cities.txt >> ' ps])
	gmt(['pstext -R -J -O -K -Dj0.15/0 -F+f12p,Courier-Bold,red+j -N >> ' ps], cities)

	% Place a yellow star at Rome
	gmt(['psxy -R -J -O -K -Sa0.2i -Gyellow -Wthin >> ' ps], [12.5 41.99])

	% Sample the distance grid at the cities and use the distance in km for labels
	dist = gmt('grdtrack cities.txt -G', Gdist);
	t = cell(5,1);
	for (k = 1:5)
		t{k} = sprintf('%f %f %d', dist.data(k,1), dist.data(k,2), round(dist.data(k,end)));
	end
	gmt(['pstext -R -J -O -D0/-0.2i -N -Gwhite -W -C0.02i -F+f12p,Helvetica-Bold+jCT >> ' ps], t)
	builtin('delete','cities.txt');
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex24(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex24/'];
	ps = [out_path 'example_24.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% Currently there is no way of avoiding creating files for this
	fid = fopen('dateline.txt', 'w');
	fprintf(fid, '> Our proxy for the dateline\n');
	fprintf(fid, '180 0\n180 -90\n');
	fclose(fid);

	fid = fopen('point.txt', 'w');
	fprintf(fid, '147:13 -42:48 6000 Hobart');
	fclose(fid);

	gmt('set -Du')
	gmt('destroy')
	R = gmt(['info -I10 ' d_path 'oz_quakes.txt']);
	gmt(['pscoast ' R.text{1} ' -JM9i -K -Gtan -Sdarkblue -Wthin,white -Dl -A500 -Ba20f10g10 -BWeSn > ' ps])
	gmt(['psxy -R -J -O -K ' d_path 'oz_quakes.txt -Sc0.05i -Gred >> ' ps])
	t = gmt(['gmtselect ' d_path 'oz_quakes.txt -Ldateline.txt+d1000k -Nk/s -Cpoint.txt+d3000k -fg -R -Il']);
	gmt(['psxy -R -JM -O -K -Sc0.05i -Ggreen >> ' ps], t)
	gmt(['psxy point.txt -R -J -O -K -SE- -Wfat,white >> ' ps])
	gmt(['pstext -R -J -O -K -F+f14p,Helvetica-Bold,white+jLT -D0.1i/-0.1i >> ' ps], {'147:13 -42:48 Hobart'})
	gmt(['psxy -R -J -O -K point.txt -Wfat,white -S+0.2i >> ' ps])
	gmt(['psxy dateline.txt -R -J -O -Wfat,white -A >> ' ps])
	builtin('delete','point.txt', 'dateline.txt');
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex25(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex25/'];
	ps = [out_path 'example_25.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	D = 30;
	gmt('set -Du')
	gmt('destroy')
	Gwetdry = gmt(['grdlandmask -Rg -I' num2str(D) 'm -Dc -A500 -N-1/1/1/1/1 -r -G']);
	%Manipulate so -1 means ocean/ocean antipode, +1 = land/land, and 0 elsewhere
	Gkey = gmt('grdmath -fg ? DUP 180 ROTX FLIPUD ADD 2 DIV =', Gwetdry);
	%Calculate percentage area of each type of antipode match.
	Gscale = gmt(['grdmath -Rg -I' num2str(D) 'm -r Y COSD 60 ' num2str(D) ' DIV 360 MUL DUP MUL PI DIV DIV 100 MUL =']);
	Gtmp = gmt('grdmath -fg ? -1 EQ 0 NAN ? MUL =', Gkey, Gscale);
	key = gmt('grd2xyz -s -ZTLf', Gtmp);
	ocean = gmt('gmtmath -bi1f -Ca -S ? SUM UPPER RINT =', key);
	Gtmp = gmt('grdmath -fg ? 1 EQ 0 NAN ? MUL =', Gkey, Gscale);
	key = gmt('grd2xyz -s -ZTLf', Gtmp);
	land = gmt('gmtmath -bi1f -Ca -S ? SUM UPPER RINT =', key);
	Gtmp = gmt('grdmath -fg ? 0 EQ 0 NAN ? MUL =', Gkey, Gscale);
	key = gmt('grd2xyz -s -ZTLf', Gtmp);
	mixed = gmt('gmtmath -bi1f -Ca -S ? SUM UPPER RINT =', key);
 
 	% Generate corresponding color table
	Ckey = gmt('makecpt -Cblue,gray,red -T-1.5/1.5/1 -N');

 	% Create the final plot and overlay coastlines
	gmt('set FONT_ANNOT_PRIMARY +10p FORMAT_GEO_MAP dddF PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter');
	gmt('destroy')
	gmt(['grdimage -JKs180/9i -Bx60 -By30 -BWsNE+t"Antipodal comparisons" -K -C -Y1.2i -nn > ' ps], Gkey, Ckey)
	gmt(['pscoast -R -J -O -K -Wthinnest -Dc -A500 >> ' ps])
	% Place an explanatory legend below
	gmt(['pslegend -R -J -O -DJBC+w6i -Y-0.2i -F+pthick >> ' ps], { ...
		'N 3'
		sprintf('S 0.15i s 0.2i red  0.25p 0.3i Terrestrial Antipodes [%d %%]', land.data)
		sprintf('S 0.15i s 0.2i blue 0.25p 0.3i Oceanic Antipodes [%d %%]', ocean.data)
		sprintf('S 0.15i s 0.2i gray 0.25p 0.3i Mixed Antipodes [%d %%]', mixed.data)})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex26(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex26/'];
	ps = [out_path 'example_26.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% first do an overhead of the east coast from 160 km altitude point straight down
	lat = 41.5;	lon = -74;	alt = 160;	tilt = 0;	azim = 0;	twist = 0;	width = 0;	height = 0;
	PROJ = sprintf('-JG%g/%g/%g/%g/%g/%g/%g/%g/4i', lon, lat, alt, azim, tilt, twist, width, height);
	gmt('set -Du')
	gmt('destroy')
	gmt(['pscoast -Rg ' PROJ ' -X1i -B5g5 -Glightbrown -Slightblue -W -Dl -N1/1p,red -N2,0.5p -P -K -Y5i > ' ps])

	% Now point from an altitude of 160 km with a specific tilt and azimuth and with a wider restricted
	% view and a boresight twist of 45 degrees
	tilt=55;	azim=210;	twist=45;	width=30;	height=30;
	PROJ = sprintf('-JG%g/%g/%g/%g/%g/%g/%g/%g/5i', lon, lat, alt, azim, tilt, twist, width, height);
	gmt(['pscoast -Rg ' PROJ ' -B5g5 -Glightbrown -Slightblue -W -Ia/blue -Di -Na -O -X1i -Y-4i >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex27(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex27/'];
	ps = [out_path 'example_27.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')

	% Gravity in tasman_grav.nc is in 0.1 mGal increments and the grid
	% is already in projected Mercator x/y units. First get gradients.
	Gtasman_grav_i = gmt(['grdgradient ' d_path 'tasman_grav.nc -Nt1 -A45 -G']);

	% Make a suitable cpt file for mGal
	grav_cpt = gmt('makecpt -T-120/120 -Crainbow');

	% Since this is a Mercator grid we use a linear projection
	gmt(['grdimage ' d_path 'tasman_grav.nc=ns/0.1 -I -Jx0.25i -C -P -K > ' ps], Gtasman_grav_i, grav_cpt)

	% Then use gmt pscoast to plot land; get original -R from grid remark
	% and use Mercator gmt projection with same scale as above on a spherical Earth

	R = gmt(['grdinfo ' d_path 'tasman_grav.nc']);
	% Here we need to fish the last word of the third (the 'Remark') line issued by grdinfo
	R = R.text{3};	k = numel(R);
	while (R(k) ~= ' ')
		k = k - 1;
	end
	R = R(k+1:end);		% The result must be -R145/170/-50.0163575733/-24.9698584055
	gmt(['pscoast ' R ' -Jm0.25i -Ba10f5 -BWSne -O -K -Gblack --PROJ_ELLIPSOID=Sphere' ...
		' -Cwhite -Dh+ --FORMAT_GEO_MAP=dddF >> ' ps])

	% Put a color legend in top-left corner of the land mask
	gmt(['psscale -DjTL+o1c+w2i/0.15i ' R ' -J -C -Bx50f10 -By+lmGal -I -O -F+gwhite+p1p >> ' ps], grav_cpt)
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex28(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex28/'];
	ps = [out_path 'example_28.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')

	% Get intensity grid and set up a color table
	GKilauea_utm_i = gmt(['grdgradient ' d_path 'Kilauea.utm.nc -Nt1 -A45 -G']);
	Kilauea_cpt = gmt('makecpt -Ccopper -T0/1500');
	% Lay down the UTM topo grid using a 1:16,000 scale
	gmt(['grdimage ' d_path 'Kilauea.utm.nc -I -C -Jx1:160000 -P -K' ...
		' --FORMAT_FLOAT_OUT=%.10g --FONT_ANNOT_PRIMARY=9p > ' ps], GKilauea_utm_i, Kilauea_cpt)
	% Overlay geographic data and coregister by using correct region and gmt(['projection with the same scale
	gmt(['pscoast -R' d_path 'Kilauea.utm.nc -Ju5Q/1:160000 -O -K -Df+ -Slightblue -W0.5p -B5mg5m -BNE' ...
		' --FONT_ANNOT_PRIMARY=12p --FORMAT_GEO_MAP=ddd:mmF >> ' ps])
	gmt(['pstext -R -J -O -K -F+f12p,Helvetica-Bold+jCB >> ' ps], {'155:16:20W 19:26:20N KILAUEA'})
	gmt(['psbasemap -R -J -O -K --FONT_ANNOT_PRIMARY=9p -LjRB+c19:23N+f+w5k+l1:16,000+u+o0.2i' ...
		' --FONT_LABEL=10p >> ' ps])
	% Annotate in km but append ,000m to annotations to get customized meter labels
	gmt(['psbasemap -R' d_path 'Kilauea.utm.nc+Uk -Jx1:160 -B5g5+u"@:8:000m@::" -BWSne -O --FONT_ANNOT_PRIMARY=10p' ...
		' --MAP_GRID_CROSS_SIZE_PRIMARY=0.1i --FONT_LABEL=10p >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex29(g_root_dir, out_path, verbose)
% THIS EXAMPLE FAILS BECAUSE THE RESULT IS WRONG
	d_path = [g_root_dir 'doc/examples/ex29/'];
	ps = [out_path 'example_29.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end
	
	gmt('set -Du')
	gmt('destroy')

	% This example uses 370 radio occultation data for Mars to grid the topography.
	% Data and information from Smith, D. E., and M. T. Zuber (1996), The shape of
	% Mars and the topographic signature of the hemispheric dichotomy, Science, 271, 184-187.

	% Make Mars PROJ_ELLIPSOID given their three best-fitting axes:
	a = 3399.472;	b = 3394.329;	c = 3376.502;

	Gproj_ellipsoid = gmt(sprintf(['grdmath -Rg -I4 -r X COSD %f DIV DUP MUL X SIND %f DIV DUP MUL ADD' ...
		' Y COSD DUP MUL MUL Y SIND %f DIV DUP MUL ADD SQRT INV ='], a, b, c));
	%  Do both Parker and Wessel/Becker solutions (tension = 0.9975)
	Gmars  = gmt(['greenspline -R? ' d_path 'mars370.txt -D4 -Sp -G'], Gproj_ellipsoid);
	Gmars2 = gmt(['greenspline -R? ' d_path 'mars370.txt -D4 -Sq0.9975 -G'], Gproj_ellipsoid);
	% Scale to km and remove PROJ_ELLIPSOID
	Gmars  = gmt('grdmath ? 1000 DIV ? SUB =', Gmars, Gproj_ellipsoid);
	Gmars2 = gmt('grdmath ? 1000 DIV ? SUB =', Gmars2, Gproj_ellipsoid);
	mars_cpt = gmt('makecpt -Crainbow -T-7/15');
	Gmars2_i = gmt('grdgradient -fg -Ne0.75 -A45 -G', Gmars2);
	gmt(['grdimage -I -C -B30g30 -BWsne -JH0/7i -P -K -E200' ...
		' --FONT_ANNOT_PRIMARY=12p -X0.75i > ' ps], Gmars2, Gmars2_i, mars_cpt)
	gmt(['grdcontour -J -O -K -C1 -A5 -Glz+/z- >> ' ps], Gmars2)
	gmt(['psxy -Rg -J -O -K -Sc0.045i -Gblack ' d_path 'mars370.txt  >> ' ps])
	gmt(['pstext -R -J -O -K -N -D-3.5i/-0.2i -F+f14p,Helvetica-Bold+jLB >> ' ps], {'0 90 b)'})
	Gmars_i = gmt('grdgradient -fg -Ne0.75 -A45 -G', Gmars);
	gmt(['grdimage -I -C -B30g30 -BWsne -J -O -K -Y4.2i -E200' ...
		' --FONT_ANNOT_PRIMARY=12p >> ' ps], Gmars, Gmars_i, mars_cpt)
	gmt(['grdcontour -J -O -K -C1 -A5 -Glz+/z- >> ' ps], Gmars)
	gmt(['psxy -Rg -J -O -K -Sc0.045i -Gblack ' d_path 'mars370.txt  >> ' ps])
	gmt(['psscale -C -O -K -R -J -DJBC+o0/0.15i+w6i/0.1i+h -I --FONT_ANNOT_PRIMARY=12p -Bx2f1 -By+lkm >> ' ps], mars_cpt)
	gmt(['pstext -R -J -O -N -D-3.5i/-0.2i -F+f14p,Helvetica-Bold+jLB >> ' ps], {'0 90 a)'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex30(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex30/'];
	ps = [out_path 'example_30.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	gmt(['psbasemap -R0/360/-1.25/1.75 -JX8i/6i -Bx90f30+u"\312" -By1g10 -BWS+t"Two Trigonometric Functions"' ...
		' -K --MAP_FRAME_TYPE=graph --MAP_VECTOR_SHAPE=0.5 > ' ps])

	%Draw sine an cosine curves
	t = gmt('gmtmath -T0/360/0.1 T COSD =');
	gmt(['psxy -R -J -O -K -W3p >> ' ps], t)
	t = gmt('gmtmath -T0/360/0.1 T SIND =');
	gmt(['psxy -R -J -O -K -W3p,0_6:0 --PS_LINE_CAP=round >> ' ps], t)

	% Indicate the x-angle = 120 degrees
	gmt(['psxy   -R -J -O -K -W0.5p,- >> ' ps], [120 -1.25; 120 1.25])
	gmt(['pstext -R -J -O -K -Dj0.2c -N -F+f+j >> ' ps], ...
		{'360 1 18p,Times-Roman RB x = cos(@%12%a@%%)'
		 '360 0 18p,Times-Roman RB y = sin(@%12%a@%%)'
		 '120 -1.25 14p,Times-Roman LB 120\312'
		 '370 -1.35 24p,Symbol LT a'
		 '-5 1.85 24p,Times-Roman RT x,y'})

	 % Draw a circle and indicate the 0-70 degree angle
	gmt(['psxy -R-1/1/-1/1 -Jx1.5i -O -K -X3.625i -Y2.75i -Sc2i -W1p -N >> ' ps], [0 0])
	seg = {[-1 0; 1 0], [0 -1; 0 1], [0 0; 1 0], [0 0; -0.5 0.866025], [-0.3333	0; 0 0], [-0.3333 0.57735; -0.3333 0]};
	hdr = {'x-gridline  -Wdefault', 'y-gridline  -Wdefault', 'angle = 0', 'angle = 120', 'x-gmt projection -W2p', 'y-gmt projection -W2p'};
	D = gmt('wrapseg', seg, hdr);
	gmt(['psxy -R-1/1/-1/1 -J -O -K -W1p >> ' ps], D)
% 	gmt(['psxy -R-1/1/-1/1 -J -O -K -W1p >> ' ps], ...
% 		[
% 		nan nan
% % 		> x-gridline  -Wdefault
% 		-1 0
% 		1 0
% 		nan nan
% % 		> y-gridline  -Wdefault
% 		0 -1
% 		0 1
% 		nan nan
% % 		> angle = 0
% 		0 0
% 		1 0
% 		nan nan
% % 		> angle = 120
% 		0 0
% 		-0.5 0.866025
% 		nan nan
% % 		> x-gmt projection -W2p
% 		-0.3333	0
% 		0	0
% 		nan nan
% % 		> y-gmt projection -W2p
% 		-0.3333 0.57735
% 		-0.3333 0])

	gmt('destroy')
	gmt(['pstext -R-1/1/-1/1 -J -O -K -Dj0.05i -F+f+a+j >> ' ps], ...
		{'-0.16666 0 12p,Times-Roman 0 CT x'
		 '-0.3333 0.2888675 12p,Times-Roman 0 RM y'
		 '0.22 0.27 12p,Symbol -30 CB a'
		 '-0.33333 0.6 12p,Times-Roman 30 LB 120\312'})

	gmt(['psxy -R -J -O -Sm0.15i+e -W1p -Gblack --PROJ_LENGTH_UNIT=cm >> ' ps], [0 0 1.26 0 120])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex31(g_root_dir, out_path, verbose)
	% TOO HARD GIVEN THE MESSY DATA FILE FORMAT
	d_path = [g_root_dir 'doc/examples/ex31/'];
	ps = [out_path 'example_31.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	ps = '';	d_path = '';

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex32(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex32/'];
	ps = [out_path 'example_32.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')

	% Here we get and convert the flag of Europe directly from the web through grdconvert using
	% GDAL support. We take into account the dimension of the flag (1000x667 pixels)
	% for a ratio of 3x2.
	% Because GDAL support will not be standard for most users, we have stored
	% the result, euflag.nc in this directory.

	Rflag = '-R3/9/50/54';
	% gmt grdconvert \
	%   http://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/1000px-Flag_of_Europe.svg.png=gd \
	%   euflag.nc=ns
	% gmt grdedit euflag.nc -fg $Rflag

	% Now get the topography for the same area from GTOPO30 and store it as topo.nc.
	% The DEM file comes from http://eros.usgs.gov/#/Find_Data/Products_and_Data_Available/gtopo30/w020n90
	% We make an gradient grid as well, which we will use to "illuminate" the flag.

	% gmt grdcut W020N90.DEM $Rflag -Gtopo.nc=ns
	Gillum = gmt(['grdgradient ' d_path 'topo.nc -A0/270 -G -Ne0.6']);

	% The color map assigns "Reflex Blue" to the lower half of the 0-255 range and
	% "Yellow" to the upper half.
	Cflag = gmt('makecpt -C0/51/153,255/204/0 -T0,127,255 -N');
	
	% The next step is the plotting of the image.
	% We use gmt grdview to plot the topography, euflag.nc to give the color, and illum.nc to give
	% the shading.

	Rplot = [Rflag '/-10/790'];
	gmt(['grdview ' d_path 'topo.nc -JM13c ' Rplot ' -C -G' d_path 'euflag.nc' ...
		' -I -Qc -JZ1c -p157.5/30 -P -K > ' ps], Cflag, Gillum)

	% We now add borders. Because we have a 3-D plot, we want them to be plotted "at elevation".
	% So we write out the borders, pipe them through grdtack and then plot them with psxyz.

	t = gmt(['pscoast ' Rflag ' -Df -M -N1']);
	t = gmt(['grdtrack -G' d_path 'topo.nc -sa'], t);
	gmt(['psxyz ' Rplot ' -J -JZ -p -W1p,white -O -K >> ' ps], t)

	% Finally, we add dots and names for three cities.
	% Again, gmt grdtrack is used to put the dots "at elevation".
	fid = fopen('cities.txt', 'w');
	fprintf(fid, '05:41:27 50:51:05 Maastricht\n');
	fprintf(fid, '04:21:00 50:51:00 Bruxelles\n');
	fprintf(fid, '07:07:03 50:43:09 Bonn\n');
	fclose(fid);
	d = gmt(['grdtrack -G' d_path 'topo.nc cities.txt']); 
	gmt(['psxyz -i0,1,3 ' Rplot ' -J -JZ -p -Sc7p -W1p,white -Gred -K -O >> ' ps], d)
	gmt(['pstext ' Rplot ' -J -JZ -p -F+f12p,Helvetica-Bold,red+jRM -Dj0.1i/0.0i -O cities.txt >> ' ps])
	builtin('delete','cities.txt');
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex33(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex33/'];
	ps = [out_path 'example_33.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')

	% Extract a subset of ETOPO1m for the East Pacific Rise
	% gmt grdcut etopo1m_grd.nc -R118W/107W/49S/42S -Gspac.nc
	z_cpt = gmt('makecpt -Crainbow -T-5000/-2000');
	Gspac_int = gmt(['grdgradient ' d_path 'spac.nc -A15 -Ne0.75 -G']);
	gmt(['grdimage ' d_path 'spac.nc -I -C -JM6i -P -Baf -K -Xc --FORMAT_GEO_MAP=dddF > ' ps], Gspac_int, z_cpt)
	% Select two points along the ridge
	ridge_pts = [-111.6 -43.0; -113.3 -47.5];
	% Plot ridge segment and end points
	gmt(['psxy -R' d_path 'spac.nc -J -O -K -W2p,blue >> ' ps], ridge_pts)
	gmt(['psxy -R -J -O -K -Sc0.1i -Gblue >> ' ps], ridge_pts)
	% Generate cross-profiles 400 km long, spaced 10 km, samped every 2km
	% and stack these using the median, write stacked profile
	table = gmt(['grdtrack -G' d_path 'spac.nc -C400k/2k/10k -Sm+sstack.txt'], ridge_pts);
	gmt(['psxy -R -J -O -K -W0.5p >> ' ps], table)
	% Show upper/lower values encountered as an envelope
	env = gmt('gmtconvert stack.txt -o0,5');
	env = [env; gmt('gmtconvert stack.txt -o0,6 -I -T')];		% Concat the two matrices
	gmt(['psxy -R-200/200/-3500/-2000 -Bxafg1000+l"Distance from ridge (km)" -Byaf+l"Depth (m)" -BWSne' ...
		' -JX6i/3i -O -K -Glightgray -Y6.5i >> ' ps], env)
	gmt(['psxy -R -J -O -K -W3p stack.txt >> ' ps])
	gmt(['pstext -R -J -O -K -Gwhite -F+jTC+f14p -Dj0.1i >> ' ps], {'0 -2000 MEDIAN STACKED PROFILE'})
	gmt(['psxy -R -J -O -T >> ' ps])
	builtin('delete','stack.txt');
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex34(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex34/'];
	ps = [out_path 'example_34.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set FORMAT_GEO_MAP dddF PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt('destroy')
	gmt(['pscoast -JM4.5i -R-6/20/35/52 -EFR,IT+gP300/8 -Glightgray -Baf -BWSne -P -K -X2i > ' ps])
	% Extract a subset of ETOPO2m for this part of Europe
	% gmt grdcut etopo2m_grd.nc -R -GFR+IT.nc=ns
	z_cpt = gmt('makecpt -Cglobe -T-5000/5000');
	FR_IT_int = gmt(['grdgradient ' d_path 'FR+IT.nc -A15 -Ne0.75']);
	gmt(['grdimage ' d_path 'FR+IT.nc -I -C -J -O -K -Y4.5i' ...
		' -Baf -BWsnE+t"Franco-Italian Union, 2042-45" >> ' ps], FR_IT_int, z_cpt)
	gmt(['pscoast -J -R -EFR,IT+gred@60 -O >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex35(g_root_dir, out_path, verbose)
% THIS EXAMPLE FAILS BECAUSE OF sphdistance
	d_path = [g_root_dir 'doc/examples/ex35/'];
	ps = [out_path 'example_35.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')

	% Get the crude GSHHS data, select GMT format, and decimate to ~20%:
	% gshhs $GMTHOME/src/coast/gshhs/gshhs_c.b | $AWK '{if ($1 == ">" || NR%5 == 0) print $0}' > gshhs_c.txt
	% Get Voronoi polygons
	[pol, nodes] = gmt(['sphtriangulate ' d_path 'gshhs_c.txt -Qv -D -N']);
	% Compute distances in km
	Gtt = gmt('sphdistance -Rg -I1 -Q -N -G -Lk', pol, nodes);
	t_cpt = gmt('makecpt -Chot -T0/3500');
	% Make a basic image plot and overlay contours, Voronoi polygons and coastlines
	gmt(['grdimage -JG-140/30/7i -P -K -C -X0.75i -Y2i > ' ps], Gtt, t_cpt)
	gmt(['grdcontour -J -O -K -C500 -A1000+f10p,Helvetica,white -L500' ...
		' -GL0/90/203/-10,175/60/170/-30,-50/30/220/-5 -Wa0.75p,white -Wc0.25p,white >> ' ps], Gtt)
	gmt(['psxy -R -J -O -K -W0.25p,green,. >> ' ps], pol)
	gmt(['pscoast -R -J -O -W1p -Gsteelblue -A0/1/1 -B30g30 -B+t"Distances from GSHHG crude coastlines" >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex36(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex36/'];
	ps = [out_path 'example_36.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% Interpolate data of Mars radius from Mariner9 and Viking Orbiter spacecrafts
	gmt('set -Du')
	gmt('destroy')
	tt_cpt = gmt('makecpt -Crainbow -T-7000/15000');
	% Piecewise linear interpolation; no tension
	Gtt = gmt(['sphinterpolate ' d_path 'mars370.txt -Rg -I1 -Q0 -G']);
	gmt(['grdimage -JH0/6i -Bag -C -P -Xc -Y7.25i -K > ' ps], Gtt, tt_cpt)
	gmt(['psxy -Rg -J -O -K ' d_path 'mars370.txt -Sc0.05i -G0 -B30g30 -Y-3.25i >> ' ps])
	% Smoothing
	Gtt = gmt(['sphinterpolate ' d_path 'mars370.txt -Rg -I1 -Q3 -G']);
	gmt(['grdimage -J -Bag -C -Y-3.25i -O -K >> ' ps], Gtt, tt_cpt)
	gmt(['psxy -Rg -J -O -T >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex37(g_root_dir, out_path, verbose)
% This example has secondary file writing that cannot be catched in a variable -- grdfft -N 

	d_path = [g_root_dir 'doc/examples/ex37/'];
	ps = [out_path 'example_37.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set FONT_TITLE 14p PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt('destroy')

	% Testing gmt grdfft coherence calculation with Karen Marks example data
	G = [d_path 'grav.V18.par.surf.1km.sq.nc'];
	T = [d_path 'mb.par.surf.1km.sq.nc'];

	z_cpt = gmt('makecpt -Crainbow -T-5000/-3000');
	g_cpt = gmt('makecpt -Crainbow -T-50/25');
	bbox_t = gmt(['grdinfo ' T ' -Ib']);			% Trouble here bbox_t is a cell array of text and we need it to be a matrix
	bbox = zeros(4,2);
	for (k = 1:4)
		bbox(k,:) = str2num(bbox_t.text{k+1});
	end
	GG_int = gmt(['grdgradient ' G ' -A0 -Nt1 -G']);
	GT_int = gmt(['grdgradient ' T ' -A0 -Nt1 -G']);
	scl   = '1.4e-5';
	sclkm = '1.4e-2';
	gmt(['grdimage ' T ' -I -Jx' scl 'i -C -P -K -X1.474i -Y1i > ' ps], GT_int, z_cpt)
	gmt(['psbasemap -R-84/75/-78/81 -Jx' sclkm 'i -O -K -Ba -BWSne+t"Multibeam bathymetry" >> ' ps])
	gmt(['grdimage ' G ' -I -Jx' scl 'i -C -O -K -X3.25i >> ' ps], GG_int, g_cpt)
	gmt(['psbasemap -R-84/75/-78/81 -Jx' sclkm 'i -O -K -Ba -BWSne+t"Satellite gravity" >> ' ps])

	cross = gmt(['grdfft ' T ' ' G ' -Ewk -N192/192+d+wtmp']);
	% grav.V18.par.surf.1km.sq_tmp.nc and mb.par.surf.1km.sq_tmp.nc are created by the '+wtmp' above
	GG_tmp_int = gmt('grdgradient grav.V18.par.surf.1km.sq_tmp.nc -A0 -Nt1 -G');
	GT_tmp_int = gmt('grdgradient mb.par.surf.1km.sq_tmp.nc -A0 -Nt1 -G');

	z_cpt = gmt('makecpt -Crainbow -T-1500/1500');
	g_cpt = gmt('makecpt -Crainbow -T-40/40');

	gmt(['grdimage mb.par.surf.1km.sq_tmp.nc -I -Jx' scl 'i -C -O -K -X-3.474i -Y3i >> ' ps], GT_tmp_int, z_cpt)
	gmt(['psxy -Rmb.par.surf.1km.sq_tmp.nc -J -O -K -L -W0.5p,- >> ' ps], bbox)
	gmt(['psbasemap -R-100/91/-94/97 -Jx' sclkm 'i -O -K -Ba -BWSne+t"Detrended and extended" >> ' ps])

	gmt(['grdimage grav.V18.par.surf.1km.sq_tmp.nc -I -Jx' scl 'i -C -O -K -X3.25i >> ' ps], GG_tmp_int, g_cpt)
	gmt(['psxy -Rgrav.V18.par.surf.1km.sq_tmp.nc -J -O -K -L -W0.5p,- >> ' ps], bbox)
	gmt(['psbasemap -R-100/91/-94/97 -Jx' sclkm 'i -O -K -Ba -BWSne+t"Detrended and extended" >> ' ps])
 
 	gmt('set FONT_TITLE 24p PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt(['psxy -R2/160/0/1 -JX-6il/2.5i -Bxa2f3g3+u" km" -Byafg0.5+l"Coherency@+2@+"' ...
		' -BWsNe+t"Coherency between gravity and bathymetry" -O -K -X-3.25i -Y3.3i -i0,15 -W0.5p >> ' ps], cross)
	gmt(['psxy -R -J -O -K -i0,15,16 -Sc0.075i -Gred -W0.25p -Ey >> ' ps], cross)
 	gmt(['psxy -R -J -O -T >> ' ps])
	builtin('delete','gmt.conf', 'grav.V18.par.surf.1km.sq_tmp.nc', 'mb.par.surf.1km.sq_tmp.nc');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex38(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex38/'];
	ps = [out_path 'example_38.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	t_cpt = gmt('makecpt -Crainbow -T0/1700');
	c_cpt = gmt('makecpt -Crainbow -T0/15/1');
	Gitopo = gmt(['grdgradient ' d_path 'topo.nc -Nt1 -fg -A45 -G']);
	Gout  = gmt(['grdhisteq ' d_path 'topo.nc -G -C16']);
	gmt(['grdimage ' d_path 'topo.nc -I -C -JM3i -Y5i -K -P -B5 -BWSne > ' ps], Gitopo, t_cpt)
	gmt(['pstext -R' d_path 'topo.nc -J -O -K -F+jTR+f14p -T -Gwhite -W1p -Dj0.1i >> ' ps], {'315 -10 Original'})
	gmt(['grdimage -C -J -X3.5i -K -O -B5 -BWSne >> ' ps], Gout, c_cpt)
	gmt(['pstext -R -J -O -K -F+jTR+f14p -T -Gwhite -W1p -Dj0.1i >> ' ps], {'315 -10 Equalized'})
	gmt(['psscale -Dx0i/-0.4i+jTC+w5i/0.15i+h+e+n -O -K -C -Ba500 -By+lm >> ' ps], t_cpt)
	Gout = gmt(['grdhisteq ' d_path 'topo.nc -G -N']);
	c_cpt = gmt('makecpt -Crainbow -T-3/3');
	gmt(['grdimage -C -J -X-3.5i -Y-3.3i -K -O -B5 -BWSne >> ' ps], Gout, c_cpt)
	gmt(['pstext -R -J -O -K -F+jTR+f14p -T -Gwhite -W1p -Dj0.1i >> ' ps], {'315 -10 Normalized'})
	Gout = gmt(['grdhisteq ' d_path 'topo.nc -G -N']);
	gmt(['grdimage -C -J -X3.5i -K -O -B5 -BWSne >> ' ps], Gout, c_cpt)
	gmt(['pstext -R -J -O -K -F+jTR+f14p -T -Gwhite -W1p -Dj0.1i >> ' ps], {'315 -10 Quadratic'})
	gmt(['psscale -Dx0i/-0.4i+w5i/0.15i+h+jTC+e+n -O -C -Bx1 -By+lz >> ' ps], c_cpt)
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex39(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex39/'];
	ps = [out_path 'example_39.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')

	% Evaluate the first 180, 90, and 30 order/degrees of Venus spherical
	% harmonics topography model, skipping the L = 0 term (radial mean).
	% File truncated from http://www.ipgp.fr/~wieczor/SH/VenusTopo180.txt.zip
	% Wieczorek, M. A., Gravity and topography of the terrestrial planets,
	%   Treatise on Geophysics, 10, 165-205, doi:10.1016/B978-044452748-6/00156-5, 2007

	Gv1 = gmt(['sph2grd ' d_path 'VenusTopo180.txt -I1 -Rg -Ng -G -F1/1/25/30']);
	Gv2 = gmt(['sph2grd ' d_path 'VenusTopo180.txt -I1 -Rg -Ng -G -F1/1/85/90']);
	Gv3 = gmt(['sph2grd ' d_path 'VenusTopo180.txt -I1 -Rg -Ng -G -F1/1/170/180']);
	t_cpt = gmt('grd2cpt -Crainbow -E', Gv3);
	Gvint = gmt('grdgradient -Nt0.75 -A45 -G', Gv1);
	gmt(['grdimage -I -JG90/30/5i -P -K -Bg -C -X3i -Y1.1i > ' ps], Gv1, Gvint, t_cpt)
	gmt(['pstext -R0/6/0/6 -Jx1i -O -K -Dj0.2i -F+f16p+jLM -N >> ' ps], {'4 4.5 L = 30'})
	gmt(['psscale --FORMAT_FLOAT_MAP="%''g" -C -O -K -Dx1.25i/-0.2i+jTC+w5.5i/0.1i+h -Bxaf -By+lm >> ' ps], t_cpt)
	Gvint = gmt('grdgradient -Nt0.75 -A45 -G', Gv2);
	gmt(['grdimage -I -JG -O -K -Bg -C -X-1.25i -Y1.9i >> ' ps], Gv2, Gvint, t_cpt)
	gmt(['pstext -R0/6/0/6 -Jx1i -O -K -Dj0.2i -F+f16p+jLM -N >> ' ps], {'4 4.5 L = 90'})
	Gv3 = gmt(['sph2grd ' d_path 'VenusTopo180.txt -I1 -Rg -Ng -G -F1/1/170/180']);
	Gvint = gmt('grdgradient -Nt0.75 -A45 -G', Gv3);
	gmt(['grdimage -I -JG -O -K -Bg -C -X-1.25i -Y1.9i >> ' ps], Gv3, Gvint, t_cpt)
	gmt(['pstext -R0/6/0/6 -Jx1i -O -K -Dj0.2i -F+f16p+jLM -N >> ' ps], {'4 4.5 L = 180'})
	gmt(['pstext -R0/6/0/6 -Jx1i -O -F+f24p+jCM -N >> ' ps], {'3.75 5.4 Venus Spherical Harmonic Model'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex40(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex40/'];
	ps = [out_path 'example_40.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')

	centroid = gmt(['spatial ' d_path 'GSHHS_h_Australia.txt -fg -Qk']);
	gmt(['psbasemap -R112/154/-40/-10 -JM5.5i -P -K -B20 -BWSne+g240/255/240 -Xc > ' ps])
	gmt(['psxy ' d_path 'GSHHS_h_Australia.txt -R -J -O -Wfaint -G240/240/255 -K >> ' ps])
	gmt(['psxy ' d_path 'GSHHS_h_Australia.txt -R -J -O -Sc0.01c -Gred -K >> ' ps])
	T500k = gmt(['gmtsimplify ' d_path 'GSHHS_h_Australia.txt -T500k']);
	t = gmt(['gmtspatial ' d_path 'GSHHS_h_Australia.txt -fg -Qk']);
	area = sprintf('Full area = %.0f km@+2@+\n', t.data(3));
	t = gmt('gmtspatial -fg -Qk', T500k); 
	area_T500k = sprintf('Reduced area = %.0f km@+2@+\n', t.data(3));
	gmt(['psxy -R -J -O -K -W1p,blue >> ' ps], T500k)
	gmt(['psxy -R -J -O -K -Sx0.3i -W3p >> ' ps], centroid)
	gmt(['pstext -R -J -O -K -Dj0.1i/0.1i -F+jTL+f18p >> ' ps], {'112 -10 T = 500 km'})
	gmt(['pstext -R -J -O -K -F+f14p+cCM >> ' ps], {area})
	gmt(['pstext -R -J -O -K -F+f14p+cLB -Dj0.2i >> ' ps], {area_T500k})
	gmt(['psbasemap -R -J -O -K -B20+lightgray -BWsne+g240/255/240 -Y4.7i >> ' ps])
	gmt(['psxy ' d_path 'GSHHS_h_Australia.txt -R -J -O -Wfaint -G240/240/255 -K >> ' ps])
	gmt(['psxy ' d_path 'GSHHS_h_Australia.txt -R -J -O -Sc0.01c -Gred -K >> ' ps])
	T100k = gmt(['gmtsimplify ' d_path 'GSHHS_h_Australia.txt -T100k']);
	t = gmt('gmtspatial -fg -Qk', T100k);
	area_T100k = sprintf('Reduced area = %.0f km@+2@+\n', t.data(3));
	gmt(['psxy -R -J -O -K -W1p,blue >> ' ps], T100k)
	gmt(['psxy -R -J -O -K -Sx0.3i -W3p >> ' ps], centroid)
	gmt(['pstext -R -J -O -K -Dj0.1i/0.1i -F+jTL+f18p >> ' ps], {'112 -10 T = 100 km'})
	gmt(['pstext -R -J -O -K -F+f14p+cCM >> ' ps], {area})
	gmt(['pstext -R -J -O -K -F+f14p+cLB -Dj0.2i >> ' ps], {area_T100k})
	gmt(['psxy -R -J -O -T >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex41(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex41/'];
	ps = [out_path 'example_41.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set FONT_ANNOT_PRIMARY 12p FONT_LABEL 12p PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt('destroy')
	gmt(['pscoast -R130W/50W/8N/56N -JM5.6i -B0 -P -K -Glightgray -Sazure1 -A1000 -Wfaint -Xc -Y1.2i --MAP_FRAME_TYPE=plain > ' ps])
	gmt(['pscoast -R -J -O -K -EUS+glightyellow+pfaint -ECU+glightred+pfaint -EMX+glightgreen+pfaint -ECA+glightblue+pfaint >> ' ps])
	gmt(['pscoast -R -J -O -K -N1/1p,darkred -A1000/2/2 -Wfaint -Cazure1 >> ' ps])
	gmt(['psxy -R -J -O -K -Sk' d_path 'my_symbol/0.1i -C' d_path 'my_color.cpt -W0.25p -: ' d_path 'my_data.txt >> ' ps])
	gmt(['pslegend -R0/6/0/9.1 -Jx1i -Dx3i/4.5i+w5.6i+jBC+l1.2 -C0.05i -F+p+gsnow1 -B0 -O ' d_path 'my_table.txt -X-0.2i -Y-0.2i >> ' ps])
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex42(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex42/'];
	ps = [out_path 'example_42.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set FONT_ANNOT_PRIMARY 12p FONT_LABEL 12p PROJ_ELLIPSOID WGS-84 FORMAT_GEO_MAP dddF PROJ_LENGTH_UNIT inch PS_CHAR_ENCODING Standard+ PS_MEDIA letter')
	gmt('destroy')
	% Data obtained via website and converted to netCDF thus:
	% curl http://www.antarctica.ac.uk//bas_research/data/access/bedmap/download/bedelev.asc.gz
	% gunzip bedelev.asc.gz
	% grdreformat bedelev.asc BEDMAP_elevation.nc=ns -V
	t_cpt = gmt('makecpt -Cearth -T-7000/4000 -N');
	gmt(['grdimage -C ' d_path 'BEDMAP_elevation.nc -Jx1:60000000 -Q -P -K > ' ps], t_cpt)
	gmt(['pscoast -R-180/180/-90/-60 -Js0/-90/-71/1:60000000 -Bafg -Di -W0.25p -O -K >> ' ps])
	gmt(['psscale -C -DjRM+w2.5i/0.2i+o0.5i/0+jLM+mc -R -J -O -K -F+p+i -Bxa1000+lELEVATION -By+lm >> ' ps], t_cpt)
	% GSHHG
	gmt(['pscoast -R-180/180/-90/-60 -J -Di -Glightblue -Sroyalblue2 -O -K -X2i -Y4.75i >> ' ps])
	gmt(['pscoast -R-180/180/-90/-60 -J -Di -Glightbrown -O -K -A+ag -Bafg >> ' ps])
	gmt(['pslegend -DjLM+w1.7i+jRM+o0.5i/0 -R-180/180/-90/-60 -J -O -K -F+p+i >> ' ps], ...
		{'H 18 Times-Roman Legend'
		'D 0.1i 1p'
		'S 0.15i s 0.2i blue  0.25p 0.3i Ocean'
		'S 0.15i s 0.2i lightblue  0.25p 0.3i Ice front'
		'S 0.15i s 0.2i lightbrown  0.25p 0.3i Grounding line'})

	% Fancy line
	gmt(['psxy -R0/7.5/0/10 -Jx1i -O -K -B0 -W2p -X-2.5i -Y-5.25i >> ' ps], ...
		[0 5.55
		2.5 5.55
		5.0 4.55
		7.5 4.55])

	gmt(['pstext -R0/7.5/0/10 -J -O -F+f18p+jBL -Dj0.1i/0 >> ' ps], {'0 5.2 BEDMAP' '0 9.65 GSHHG'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex43(g_root_dir, out_path, verbose)
% THIS EXAMPLE ...
	d_path = [g_root_dir 'doc/examples/ex43/'];
	ps = [out_path 'example_43.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	model    = gmt(['regress -Ey -Nw -i0:1l ' d_path 'bb_weights.asc']);
	rls_line = gmt(['regress -Ey -Nw -i0:1l ' d_path 'bb_weights.asc -Fxmc -T-2/6/0.1']);
	ls_line  = gmt(['regress -Ey -N2 -i0:1l ' d_path 'bb_weights.asc -Fxm -T-2/6/8']);
% 	grep -v '^>' model.txt > A.txt
% 	grep -v '^#' bb_weights.asc > B.txt

	ps = '';	d_path = '';

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex44(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex44/'];
	ps = [out_path 'example_44.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% Bottom map of Australia
	gmt('set -Du')
	gmt('destroy')
	gmt(['pscoast -R110E/170E/44S/9S -JM6i -P -Baf -BWSne -Wfaint -N2/1p  -EAU+gbisque -Gbrown' ...
		' -Sazure1 -Da -K -Xc --FORMAT_GEO_MAP=dddF > ' ps])
	gmt(['psbasemap -R -J -O -K -DjTR+w1.5i+o0.15i/0.1i+sxx000 -F+gwhite+p1p+c0.1c+s >> ' ps])
	t = load('xx000');		% x0 y0 w h
	cmd = sprintf('pscoast -Rg -JG120/30S/%f -Da -Gbrown -A5000 -Bg -Wfaint -EAU+gbisque -O -K -X%f -Y%f >> %s', t(3), t(1), t(2), ps);
	gmt(cmd)
	gmt(sprintf('psxy -R -J -O -K -T -X-%f -Y-%f >> %s', t(1), t(2), ps))
	% Determine size of insert map of Europe
	t = gmt('mapproject -R15W/35E/30N/48N -JM2i -W');	% w h
	gmt(['pscoast -R10W/5E/35N/44N -JM6i -Baf -BWSne -EES+gbisque -Gbrown -Wfaint -N1/1p -Sazure1' ...
		' -Df -O -K -Y4.5i --FORMAT_GEO_MAP=dddF >> ' ps])
	gmt(sprintf('psbasemap -R -J -O -K -DjTR+w%f/%f+o0.15i/0.1i+sxx000 -F+gwhite+p1p+c0.1c+s >> %s', t.data(1), t.data(2), ps))
	t = load('xx000');		% x0 y0 w h
	cmd = sprintf('pscoast -R15W/35E/30N/48N -JM%f -Da -Gbrown -B0 -EES+gbisque -O -K -X%f -Y%f ', t(3), t(1), t(2));
	gmt([cmd '--MAP_FRAME_TYPE=plain >> ' ps])
	gmt(sprintf('psxy -R -J -O -T -X-%f -Y-%f >> %s', t(1), t(2), ps))
	builtin('delete','xx000');
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex45(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex45/'];
	ps = [out_path 'example_45.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	% Basic LS line y = a + bx
	gmt('set -Du')
	gmt('destroy')
	model = gmt(['trend1d -Fxm ' d_path 'CO2.txt -Np1']);
	gmt(['psxy -R1958/2016/310/410 -JX6i/1.9i -P -Bxaf -Byaf+u" ppm" -BWSne+gazure1 -Sc0.05c -Gred -K ' d_path 'CO2.txt -X1.5i > ' ps])
	gmt(['psxy -R -J -O -K -W0.5p,blue >> ' ps], model)
	gmt(['pstext -R -J -O -K -F+f12p+cTL -Dj0.1i -Glightyellow >> ' ps], {'m@-2@-(t) = a + b\264t'})
	% Basic LS line y = a + bx + cx^2
	model = gmt(['trend1d -Fxm ' d_path 'CO2.txt -Np2']);
	gmt(['psxy -R -J -O -Bxaf -Byaf+u" ppm" -BWSne+gazure1 -Sc0.05c -Gred -K ' d_path 'CO2.txt -Y2.3i >> ' ps])
	gmt(['psxy -R -J -O -K -W0.5p,blue >> ' ps], model)
	gmt(['pstext -R -J -O -K -F+f12p+cTL -Dj0.1i -Glightyellow >> ' ps], {'m@-3@-(t) = a + b\264t + c\264t@+2@+'})
	% Basic LS line y = a + bx + cx^2 + seasonal change
	model = gmt(['trend1d -Fxmr ' d_path 'CO2.txt -Np2,f1+o1958+l1']);
	gmt(['psxy -R -J -O -Bxaf -Byaf+u" ppm" -BWSne+gazure1 -Sc0.05c -Gred -K ' d_path 'CO2.txt -Y2.3i >> ' ps])
	gmt(['psxy -R -J -O -K -W0.25p,blue >> ' ps], model)
	gmt('destroy')
	gmt(['pstext -R -J -O -K -F+f12p+cTL -Dj0.1i -Glightyellow >> ' ps], ...
		{'m@-5@-(t) = a + b\264t + c\264t@+2@+ + d\264cos(2@~p@~t) + e\264sin(2@~p@~t)'})
	% Plot residuals of last model
	gmt(['psxy -R1958/2016/-4/4 -J -Bxaf -Byafg10+u" ppm" -BWSne+t"The Keeling Curve [CO@-2@- at Mauna Loa]"+gazure1' ...
		' -Sc0.05c -Gred -O -K -i0,2 -Y2.3i >> ' ps], model)
	gmt('destroy')
	gmt(['pstext -R -J -O -F+f12p+cTL -Dj0.1i -Glightyellow >> ' ps], {'@~e@~(t) = y(t) - m@-5@-(t)'})
	builtin('delete','gmt.conf');

% -------------------------------------------------------------------------------------------------
function [ps, d_path] = ex46(g_root_dir, out_path, verbose)
	d_path = [g_root_dir 'doc/examples/ex46/'];
	ps = [out_path 'example_46.ps'];
	if (verbose),	disp(['Running example ' ps(end-4:end-3)]),	end

	gmt('set -Du')
	gmt('destroy')
	gmt(['pscoast -Rd -JKs0/10i -Dl -A5000 -W0.5p -N1/0.5p,gray -S175/210/255 -Bafg --MAP_FRAME_TYPE=plain -K -Xc > ' ps])
	gmt(['pssolar -R  -J -Td+d2016-02-09T16:00:00 -Gnavy@95 -K -O >> ' ps])
	gmt(['pssolar -R  -J -Tc+d2016-02-09T16:00:00 -Gnavy@85 -K -O >> ' ps])
	gmt(['pssolar -R  -J -Tn+d2016-02-09T16:00:00 -Gnavy@80 -K -O >> ' ps])
	gmt(['pssolar -R  -J -Ta+d2016-02-09T16:00:00 -Gnavy@80 -K -O >> ' ps])
	t = gmt('pssolar -I+d2016-02-09T16:00:00 -C -o0,1');
	gmt(['psxy -R -J -Sk' d_path 'sunglasses/1.5c -Gyellow -O >> ' ps], t)
	builtin('delete','gmt.conf');

