# Eitch Slime Shader
A slime/goo shader for Material Editor.

* Create tranlucent characters.
* Supports liquid textures with customizable liquid color.
* Chromatic abberation for prismatic effects.

#### Important Material properties
* __Alpha__ - Surface transparency.
* __Color__ - Slime color.
* __MatCap__ - World reflection map.
* __MatCapAlpha__ - Strength of the world reflection.
* __Refraction__ - Refractive index of the surface. Light will 'bend' more upon entering and leaving the object 
at tangential angles. 1 is neutral (no refraction) with higher and lower amounts resulting in more refraction in
 either direction.
* __ChromaticAberration__ - Higher chromatic aberration will result in a greater difference in refration based on the
wavelength of the light passing through the object. (Prismatic effect).
* __LiquidColor__ - Tint the color of the surface 'liquid'.
* __RippleMap__ - An additional normal map that will peturb the surface normals. Default texture is a ripple-looking texture.
* __RippleStrength__ - Strenght of the ripple map. Defaults to 0 as the effect can be very hit/miss.

See the manifest file for a list of all material properties.

## Source Requirements
* [Amplify Shader Editor](https://assetstore.unity.com/packages/tools/visual-scripting/amplify-shader-editor-68570)

## Runtime Requirements
\- none -

## Todo/Improvements
* Hair-front version of the shader that lets eyebrows show through. Or change the render queue to let those elements
 draw after.
* Find out how the clothing clipping masks hide the default body shader.

## Attributions
Forked from [IllusionMods/KoikatsuModdingTools](https://github.com/IllusionMods/KoikatsuModdingTools)
