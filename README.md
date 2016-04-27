# Managed Tokens Interface

## ERC-20 Enabled API for Cryptocurrency Exchanges

### Introduction

Ethereum is a public blockchain platform with programmable transaction functionality.  It provides a decentralized stack based virtual machine that allows the deployment and execution of business logic through pre-defined state transition rules.  These rules are commonly referred in the Ethereum knowledge domain as "smart contracts", "contracts", or "DApps".  

One of the most basic forms of a contract is the token ledger or "meta-currency" which provides a mapping of accounts to balances (a ledger of accounts) as well as provides rules of accounting (i.e. how balances can be transferred from one account to another) .  

### Rationale

[ERC-20](https://github.com/ethereum/EIPs/issues/20) is a proposed standard for creating a meta-currency ledger on Ethereum.  The aim of this project is to provide a basic JSONRPC based interface to allow exchanges and other similar services to manage deposits and withdrawals of ERC-20 compatible tokens to and from a centrally controlled account while providing the ability to track deposits and withdrawals.   

### Roadmap

- ~~Managed Token that provides ability to create unique deposit addresses, track deposits, and track withdrawals.~~
- Draft proposal for standard RPC calls.
- Native server with multi-platform support (Windows, OS X, Linux, FreeBSD, etc..)
- Transaction history logging
- Ability to add/register new ERC-20 compatible tokens at runtime.

