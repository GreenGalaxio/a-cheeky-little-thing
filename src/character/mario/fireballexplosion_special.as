// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fireballexplosion_special

package 
{
    import flash.display.MovieClip;

    public dynamic class fireballexplosion_special extends MovieClip 
    {

        public function fireballexplosion_special()
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

