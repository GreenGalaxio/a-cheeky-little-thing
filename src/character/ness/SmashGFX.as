// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//SmashGFX

package 
{
    import flash.display.MovieClip;

    public dynamic class SmashGFX extends MovieClip 
    {

        public function SmashGFX()
        {
            addFrameScript(27, this.frame28);
        }

        internal function frame28():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

