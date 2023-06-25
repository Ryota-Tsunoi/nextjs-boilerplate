// NOTE: For Github page deployment, we need to set the output mode to 'export'
const outputMode = process.env.BRANCH_NAME ? 'export' : 'standalone';

/** @type {import('next').NextConfig} */
const nextConfig = {
  eslint: {
    ignoreDuringBuilds: true,
  },
  output: outputMode,
};

module.exports = nextConfig;
