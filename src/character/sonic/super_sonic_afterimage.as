// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//super_sonic_afterimage

package 
{
    import flash.display.MovieClip;

    public dynamic class super_sonic_afterimage extends MovieClip 
    {

        public function super_sonic_afterimage()
        {
            addFrameScript(7, this.frame8);
        }

        internal function frame8():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

