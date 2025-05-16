// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//coineffect

package 
{
    import flash.display.MovieClip;

    public dynamic class coineffect extends MovieClip 
    {

        public function coineffect()
        {
            addFrameScript(23, this.frame24);
        }

        internal function frame24():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

