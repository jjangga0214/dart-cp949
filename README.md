# dart-cp949

CP949 (EUC-KR 포함)을 Encode, Decode 해 주는 라이브러리입니다.

[![license](https://img.shields.io/badge/license-MIT-ff4081.svg?style=flat-square&labelColor=black)](./LICENSE)
[![.nvmrc](https://img.shields.io/badge/.nvmrc-14-00e676.svg?style=flat-square&labelColor=black)](./.nvmrc)
[![yarn:devDependency](https://img.shields.io/badge/yarn-required-aeea00.svg?style=flat-square&labelColor=black)](https://yarnpkg.com/en/)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-ffab00.svg?style=flat-square&labelColor=black)](https://conventionalcommits.org)
[![Commitizen friendly](https://img.shields.io/badge/Commitizen-cz_conventional_changelog-dd2c00.svg?style=flat-square&labelColor=black)](http://commitizen.github.io/cz-cli/)
![pr welcome](https://img.shields.io/badge/PRs-welcome-09FF33.svg?style=flat-square&labelColor=black)

## 🚧 Under construction

개발중입니다.

## Installation

```yaml
dependencies:
  cp949: ^0.0.1
```

## Why?

Dart 는 non-unicode 인코딩/디코딩을 native 하게 지원하지 않습니다.
CP949 에 대해서는 글을 쓰는 시점으로 이 라이브러리가 유일해 보입니다.

## Usage

### `decode()`

CP949 (EUC-KR) byte 배열을 (`List<int>`) 받아 dart 의 native String 을 리턴합니다.

```dart
import 'package:cp949/cp949.dart' as cp949;

const cp949CodeUnitBytes = [0xBE, 0xC6, 0xB8, 0xA7, 0xB4, 0xD9, 0xbf, 0xee];
print(cp949.decode(cp949CodeUnitBytes)); // "아름다운" 출력
```

### `encode()`

dart 의 native String 을 받아 CP949 (EUC-KR) byte 배열로 (`List<int>`) 리턴합니다.

```dart
import 'package:cp949/cp949.dart' as cp949;

print(cp949.encode("아름다운")); // "[0xBE, 0xC6, 0xB8, 0xA7, 0xB4, 0xD9, 0xbf, 0xee]" 출력
```

## Example

```dart
import 'package:http/http.dart' as http;
import 'package:cp949/cp949.dart' as cp949;

const url = "https://euc-kr-encoded-website.co.kr";
final response = await http.get(url);
print(cp949.decode(response.bodyBytes));
```

## Development (Contribution)

이 project 는 마크다운 린트, 커밋 메세지 린트 등 개발환경 설정을 위해 yarn과 nodejs package 들을 사용합니다.

```shell
yarn install
yarn test
yarn format:md .
yarn format .
```

## License

[MIT License](LICENSE). Copyright &copy; 2020, GIL B. Chan <[bnbcmindnpass@gmail.com](mailto:bnbcmindnpass@gmail.com)>
