# Generation Modes

Use these modes to control how much of a learning pack to generate.

## `skeleton`

Use when the user wants the topic structure prepared first.

Create:

- Topic root folders in `lectures/`, `labs/`, `notes/`, `projects/`, `reviews/`
- Topic root `README.md` files
- Minimal file map for what will exist later
- Notes, project, and review scaffolding if clearly useful

Avoid:

- Full lecture content
- Detailed lab content
- Deep project specs unless explicitly asked

## `lecture-first`

Use when the user wants real learning content now, but detailed labs or projects can wait.

Create:

- Lecture set
- Topic root READMEs
- Notes scaffolding
- Project/review timing guidance
- Lab scaffolding or concise task cards only if needed for structure

Avoid:

- Fully detailed lab specs if the user said to defer them

## `full-pack`

Use when the user asks for the complete learning pack.

Create:

- Lectures
- Labs
- Topic notes structure
- Projects
- Reviews
- Navigation updates

## `incremental`

Use when the topic pack already exists and the user wants one part extended or refined.

Examples:

- Add lecture 04 and update pack index
- Flesh out labs after a lecture-first pass
- Add project templates once enough stages are complete
- Improve review templates based on prior use

## Mode Selection Heuristics

- If the request says `先搭结构`, choose `skeleton`
- If the request says `lab 等后面再说`, choose `lecture-first`
- If the request says `生成学习包`, choose `full-pack` unless other constraints override it
- If the request targets one directory or one stage only, choose `incremental`
