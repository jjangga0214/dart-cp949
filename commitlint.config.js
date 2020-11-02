module.exports = {
    extends: ['@commitlint/config-conventional'],
    rules: {
        'header-max-length': [0, 'always', 100], // corresponding to maxHeaderWidth of commitizen
        'header-case': [
            0,
            'always',
            [
                'lower-case', // default
                'upper-case', // UPPERCASE
                'camel-case', // camelCase
                'kebab-case', // kebab-case
                'pascal-case', // PascalCase
                'sentence-case', // Sentence case
                'snake-case', // snake_case
                'start-case', // Start Case
            ],
        ],
        'subject-case': [
            0,
            'always',
            [
                'lower-case', // default
                'upper-case', // UPPERCASE
                'camel-case', // camelCase
                'kebab-case', // kebab-case
                'pascal-case', // PascalCase
                'sentence-case', // Sentence case
                'snake-case', // snake_case
                'start-case', // Start Case
            ],
        ],
    },
}