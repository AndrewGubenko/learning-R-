library(RODBC)

connToSage <- function() {odbcConnect("SOTAMAS90", uid = 'ag|ITA', pwd = 'password')}
if (!exists("conn"))
  conn <- connToSage() else
    if (!RODBC:::odbcValidChannel(conn))
      conn <- connToSage()


todayinventory <- sqlQuery(conn, paste0(
 
  "SELECT 
  t1.ItemCode, 
  t1.RoutingNo, 
  t2.WarehouseCode, 
  t2.QuantityOnHand, 
  t2.QuantityOnSalesOrder, 
  t2.QuantityOnBackOrder, 
  t2.QuantityOnPurchaseOrder  
  FROM 
  CI_Item t1, 
  IM_ItemWarehouse t2
  WHERE t1.ItemCode = t2.ItemCode
  AND t2.WarehouseCode = '000'  
  ORDER BY t2.WarehouseCode" 
)) 

head(todayinventory)

