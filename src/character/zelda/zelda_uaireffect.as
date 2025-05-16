// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_uaireffect

package 
{
    import flash.display.MovieClip;

    public dynamic class zelda_uaireffect extends MovieClip 
    {

        public function zelda_uaireffect()
        {
            addFrameScript(19, this.frame20);
        }

        internal function frame20():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

