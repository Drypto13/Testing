from brownie import *

def test_deploys():
    l = Logic.deploy({'from':accounts[0]})
    p = Proxy_0_8.deploy(l, {'from':accounts[0]})
    c = Contract.from_abi('',p,Logic.abi)
    c.setData([1], {'from':accounts[0]})
    print(c.address)
    print(c.data())
    assert(False)

def secondary():
    l = Logic.deploy({'from':accounts[0]})
    #p = Proxy_0_8.deploy(l, {'from':accounts[0]})
    p = Contract.from_abi('','0x7a2088a1bFc9d81c55368AE168C2C02570cB814F',Proxy_0_8.abi) #add in deployed proxy address
    p.replaceImplementation(l, {'from':accounts[0]})
    c = Contract.from_abi('',p,Logic.abi)
    #c.setData(1, {'from':accounts[0]})
    print(c.address)
    print(c.getData())
    assert(False)