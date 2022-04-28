import { getConnection } from "../database/sql_instance";

export const getProductInfo = async (req,res) => {
    const pool = await getConnection();
    const _ProductID = req.params.idp;
    const _query = "EXEC dbo.GetProductInfo '"+_ProductID+"'";
    const result = await pool.request().query(_query);
    res.json(result);
}