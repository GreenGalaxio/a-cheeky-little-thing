// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//explosion_special

package 
{
    import flash.display.MovieClip;

    public dynamic class explosion_special extends MovieClip 
    {

        public function explosion_special()
        {
            addFrameScript(16, this.frame17);
        }

        internal function frame17():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

