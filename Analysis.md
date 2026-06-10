```bash
$ forge test --rerun -vvvv
```

---
```bash
$ forge inspect src/PasswordStore.sol storage
```

| Name       | Type    | Slot | Offset | Bytes | Contract                            |
|------------|----------|-------|---------|--------|-------------------------------------|
| s_owner    | address  | 0     | 0       | 20     | src/PasswordStore.sol:PasswordStore |
| s_password | string   | 1     | 0       | 32     | src/PasswordStore.sol:PasswordStore |

---
```bash
$ make deploy
```

```text
== Return ==
0: contract PasswordStore 0x5FbDB2315678afecb367f032d93F642f64180aa3
```

---
```bash
$ cast storage 0x5FbDB2315678afecb367f032d93F642f64180aa3 0
```

```text
0x000000000000000000000000f39fd6e51aad88f6f4ce6ab8827279cfffb92266
```

---
```bash
$ cast storage 0x5FbDB2315678afecb367f032d93F642f64180aa3 1
```

```text
0x6d7950617373776f726400000000000000000000000000000000000000000014
```

---
```bash
$ cast parse-bytes32-string \
0x6d7950617373776f726400000000000000000000000000000000000000000014
```

```text
myPassword
```

---
```bash
$ cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "setPassword(string memory newPassword)" \
  "hello hello hello" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

---
```bash
$ cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
  "getPassword()" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

```text
0x0000000000000000000000000000000000000000000000000000000000000020
0000000000000000000000000000000000000000000000000000000000000011
68656c6c6f2068656c6c6f2068656c6c6f000000000000000000000000000000
```

---
```bash
$ cast storage 0x5FbDB2315678afecb367f032d93F642f64180aa3 1 \
  | cut -c3-36 \
  | xxd -r -p
```

```text
hello hello hello%
```

---
```bash
$ cast storage 0x5FbDB2315678afecb367f032d93F642f64180aa3 1 \
  | cut -c3-36 \
  | xxd -r -p
```

```text
hello hello hello%
```