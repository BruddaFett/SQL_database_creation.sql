#ROYCE
   	#VIEW 1 OF 3
	#FIND [Alcohol Brand] BY grouped DIST	
CREATE OR REPLACE VIEW ALC_Distributor_with_Brand
AS 
SELECT
	DistId 			AS 'Distributor ID',
	distribution.name 	AS Distributor,
    alcohol.name		AS 'Alcohol Brand'
FROM distribution
   JOIN alcoholdetail USING (DistId)
   JOIN alcohol 	   USING (AlcoholId)
GROUP BY DistId;

#VIEW 2 OF 3
#FIND [Glass Brand] BY grouped DIST
CREATE OR REPLACE VIEW GLASS_Distributor_with_Brand
AS 
SELECT
	DistId 			AS 'Distributor ID',
	distribution.name 	AS Distributor,
    glassware.brand		AS 'Glassware Brand'
FROM distribution
   JOIN glassdetail USING (DistId)
   JOIN glassware 	USING (GlassId)
GROUP BY DistId;

	#	VIEW 3 OF 3
    #	FIND [Dry Good Brand] BY grouped DIST
CREATE OR REPLACE VIEW DryGood_Distributor_with_Brand
AS 
SELECT
	DistId 			AS 'Distributor ID',
	distribution.name 	AS Distributor,
    drygoods.name		AS 'Dry Good Brand'
FROM distribution
   JOIN goodsdetail USING (DistId)
   JOIN drygoods    USING (DryId)
GROUP BY DistId;

		# ROYCE QUERY
		# CASE BREAK QUERY
SELECT 
	name 			AS Name,
	orderId			AS 'Order Number', 
	date 			AS Date, 
	ppu			AS PPU,
    COUNT(casesize) AS 'Number of Case`s'
FROM alcoholdetail
	JOIN alcohol USING (alcoholid)
    	JOIN orders  USING (alcDetailsId)
WHERE casesize > 1
GROUP BY orderId;

		# ROYCE QUERY 
        # TRACKING PRICING	
SELECT glassId 		   AS 'Glass Id',
	   CONCAT('$',PPU) AS 'Price Per Unit',
       brand 		   AS Brand, 
       style 		   AS Style,
       date  		   AS Date
FROM   glassware
	JOIN glassdetail USING (glassid)
WHERE glassid = 5
GROUP BY date;
