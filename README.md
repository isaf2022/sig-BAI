# sig-BAI

This document is also available in [Portuguese](./docs/README-pt-AO.md).

## What is

It is a simulation of a management system for an angolan bank: [BAI (Banco Angolano de Investimentos)](https://www.bancobai.ao/pt/particulares).

## Motivation

The motivation for this repository is a school project where the goal is to simulate some of the operations done in BAI using concepts of algorithms. This is done in portugol, an algorithm syntax similar to portuguese. This is only for educational purposes and couldn't or shouldn't be used in production.

## Specs

1. The system needs to be capable of storing data in memory making use of arrays, and also needs to apply all the concepts related to algorithms that were learned.

2. It needs to have the following functionalities:

  - Client registration
  - Bank account creation
  - Money deposit
  - cash withdrawal
  - Check balance
  - Transfer money
  - Update personal information
  - List customers
  - Backup
  - And Restore

3. It should give the user a menu to choose among the above functionalities. Something like this:

![An example of a menu in SPA Pro](./docs/menu-options.png)

## How to test

You should have SPA Pro installed or some other program that recognizes that portugol syntax.
Before running the program you should alter the path to acccess the program's backup file.

```
  constante literal caminho_ficheiro_backup <- "path/to/backup/file" // replace this string with the absolute path to the **backup_isaf.txt** file inside of this repository in order to work
```

Go to line 16 and replace the value of caminho_ficheiro_backup variable with the absolute path to the file **./backup/backup_isaf.txt** inside of this repo.

### Contrib

If you find a bug, please open an issue on [issues section of this repository](https://github.com/isaf2022/sig-BAI/issues) on Github, or you could open a [pull request](https://github.com/isaf2022/sig-BAI/pulls) to suggest modifications and improovements.