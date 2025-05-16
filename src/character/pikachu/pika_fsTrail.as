// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pika_fsTrail

package 
{
    import flash.display.MovieClip;

    public dynamic class pika_fsTrail extends MovieClip 
    {

        public function pika_fsTrail()
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

