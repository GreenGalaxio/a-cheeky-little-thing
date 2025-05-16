// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//explosionNewPower

package 
{
    import flash.display.MovieClip;

    public dynamic class explosionNewPower extends MovieClip 
    {

        public function explosionNewPower()
        {
            addFrameScript(10, this.frame11);
        }

        internal function frame11():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

