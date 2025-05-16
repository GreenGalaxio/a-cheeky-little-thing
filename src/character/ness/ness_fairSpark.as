// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fairSpark

package 
{
    import flash.display.MovieClip;

    public dynamic class ness_fairSpark extends MovieClip 
    {

        public function ness_fairSpark()
        {
            addFrameScript(5, this.frame6);
        }

        internal function frame6():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

