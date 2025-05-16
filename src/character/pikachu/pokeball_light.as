// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pokeball_light

package 
{
    import flash.display.MovieClip;

    public dynamic class pokeball_light extends MovieClip 
    {

        public function pokeball_light()
        {
            addFrameScript(17, this.frame18);
        }

        internal function frame18():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

