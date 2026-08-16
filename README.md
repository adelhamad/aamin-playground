# aamin-playground

Throwaway target repo for testing [aamin](https://github.com/adelhamad/aamin) end to end:
real clones, real builds from this repo's Dockerfiles, real pull-request previews.

## Dockerfile variants

Each image serves a visibly different page, so it is easy to confirm which Dockerfile was selected:

```sh
# Default dark UI
docker build -t aamin-playground:default .

# Experimental blueprint UI
docker build -f preview.Dockerfile -t aamin-playground:preview .

# Stable production UI
docker build -f production.Dockerfile -t aamin-playground:production .
```

Run any variant on port 8080, for example:

```sh
docker run --rm -p 8080:80 aamin-playground:preview
```

Nothing here is production. Delete freely.
