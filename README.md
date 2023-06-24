# Next-boilerplate

このプロジェクトは、Next.js、TypeScript、React、npm、および Yarn を使用して作成されたボイラープレートです。このプロジェクトを使用すると、すぐに開発を開始できます。

## Getting started

このプロジェクトを使用するには、まずリポジトリをクローンしてください。

```bash
git clone https://github.com/Ryota-Tsunoi/next-boilerplate.git
```

次に、必要なパッケージをインストールします。このプロジェクトでは yarn を使用するので、必要に応じて事前に yarn のインストールをしてください。

```bash
cd next-boilerplate
yarn install
```

開発サーバーが立ち上がり、localhost にアクセスしてアプリが立ち上がっていることを確認してください。

```bash
yarn dev
# after boot server, access to http://localhost:5200
```

## Structures

ルートディレクトリの構成は以下のようになっています。
メンテナンス性を考慮し、ドメイン固有のコードを`src/features/`以下に閉じ込めることで、共有のコードとドメイン固有のコードを混在させないようにしています。

```txt
.
├──  .vscode         # 開発者間で共有するVSCodeの設定ファイル
├──  public          # パブリックで使用する画像など
├──  scripts         # 開発用のスクリプト
├──  src
│  ├──  app
│  ├──  components   # アプリ全体で共有する汎用的なコンポーネント群です
│  ├──  configs      # アプリ全体で共有するコンフィグや、env設定です
│  ├──  features     # 機能ベースで分けられたモジュール群です(後述)
│  ├──  hooks        # アプリ全体で共有するHooksを定義します
│  ├──  lib          # ライブラリをRe-exportして、変更箇所を閉じるために用います
│  ├──  providers    # アプリ全体で共有するプロバイダーです
│  ├──  stores       # アプリ全体で共有するStateストアです
│  ├──  types        # TypeScriptで使用するアプリ全体で共有する型定義です
│  └──  utils        # アプリ全体で共有するユーティリティ関数です
```

`src/features`は以下の構造を持ちます。

```txt
.src/features/some-feature
├──  api        # この機能に関連するAPIリクエストの宣言とAPIフックをエクスポートします
├──  assets     # この機能に関連するすべての静的ファイルを含むアセットです
├──  components # この機能にスコープされたコンポーネントです
├──  hooks      # この機能にスコープされたフックです
├──  stores     # この機能に関連するStateストアです
├──  types      # TypeScriptで使用する特定の機能ドメインの型定義です
├──  utils      # この機能に関連するユーティリティ関数です
├──  index.ts   # この機能のエントリーポイントであり、この機能の公開APIとして機能し、機能外で使用するすべてをエクスポートします
```

`index.ts`がその機能のパブリック API として機能し、他の機能から参照する時は、すべて`index.ts`経由で Export されるようにします。

## Commands

`yarn dev`

- 開発サーバーを起動します。ポート番号 5200 で
  実行されます。

`yarn build`

- アプリケーションをプロダクション用にビルドします。

`yarn start`

- プロダクション用にビルドされたアプリケーションを起動します。

`yarn lint`

- ESLint を使用して、.js、.jsx、.ts、.tsx ファイルを検証します。

`yarn create:feature ${args1}`

- 新しい機能を`src/features`フォルダ下に作成するためのスクリプトを実行します。$args1 は、新しい機能の名前に置き換えてください。
  - ex) `yarn create:feature awesome-feature`

`yarn create:component ${args1} ${args2}`

- 新しいコンポーネントを`src/components`もしくは、`src/features/feature-name/components`フォルダ下に作成するためのスクリプトを実行します。

  - $args1 は、新しいコンポーネントの名前に置き換えてください。
  - $args2 は、機能の名前に置き換えてください。

- `src/components`にコンポーネントを作りたい場合は、$args1 のみ指定してください。

  - ex) `yarn create:component Button`

- `src/features/feature-name/components`にコンポーネントを作りたい場合は、 $args1, $args2 を指定してください。
  - ex) `yarn create:component Button feature-name`
