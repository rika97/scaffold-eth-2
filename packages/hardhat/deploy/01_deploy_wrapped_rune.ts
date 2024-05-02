import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";

const deployFunction: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployments, getNamedAccounts } = hre;
  const { deploy } = deployments;

  const { deployer } = await getNamedAccounts();

  await deploy("WrappedRune", {
    from: deployer,
    args: ["WrappedRune", "wRUNE", "1000000000000000000000000"],
    log: true,
  });

  await deploy("WrappedRuneFactory", {
    from: deployer,
    args: [],
    log: true,
  });
};
export default deployFunction;
deployFunction.tags = ["WrappedRune", "WrappedRuneFactory"];
