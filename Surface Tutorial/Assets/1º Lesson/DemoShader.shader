// Shader Category / Name
Shader "Custom/Research/Diffuse Texture" {
	// Shader Properties from Unity
	Properties{
		_MainTex ("Texture", 2D) = "white" {}
	}
	
	// SubShader for each kind of hardware
	// It goes from the top, to the bottom, until hits Fallback.
	// It could be one for PC, Xbox, PS3, etc
	SubShader {
	
		// SubShader Tags
		// Tells how we are trying to render things in this shader
		// You could use Opaque, Transparent, etc
		Tags { "RenderType" = "Opaque" }
		LOD 200
		
		// Start CG programming
		CGPROGRAM
		#pragma surface surf Lambert
		
		// Remember Lambertian Lightning? So... "Lambert" above is just telling
		// That we are using that model of lightning. Lambertian = Diffuse Lightning.
		// There is also BlinnPhong = Shinning, or Specular Lightnings.
		// If you know how to do it, you could make your CustomLightning Model.
		
		// Properties Variables
		uniform sampler2D _MainTex; // _MainTex Texture2D Sampler.
		
		// Structs 
		// Surface Input
		// UV Coord, Vertex Color, View Direction, World Reflections...
		struct Input {
			float2 _MainTex_UV; // Texture UV Coordenates
		};
		
		// Surf function
		// Input is our input structure and we have our SurfaceOuput
		// Which is the result of the function. 
		// It has all the properties needed to give color, alpha, etc.
		void surf (Input i, inout SurfaceOutput o) {
			
			// Get Data from Sampler using tex2D(Sampler2D, UV_Coordinate);
			fixed4 c = tex2D(_MainTex, i._MainTex_UV); 			
			
			// o.Albedo = RGB Color
			// o.Alpha = A Color
			o.Albedo = c.rgb; // RGB because Texture2D is RGBA.
			o.Alpha = c.a; // A for Alpha.
		}
		
		ENDCG
	}
	
	// If everything goes wrong, just use Diffuse.
	Fallback "Diffuse"
}