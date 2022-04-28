import Router from "express";
import { getProductInfo } from "../controllers/controller";

const router = Router();

router.get("/product/:idp", getProductInfo);

export default router;